# Target image architecture (amd64 or arm64), defaults to the host architecture
arch ?= $(shell uname -m | sed -e 's/x86_64/amd64/' -e 's/aarch64/arm64/')

ci: clean deps lint build-docker-base

clean:
	rm -rf logs modules

init:
	mkdir -p artifacts

define python_venv
	. .venv/bin/activate && $(1)
endef

deps:
	gem install bundler
	bundle install -j4
	r10k puppetfile install --moduledir modules --verbose
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements.txt)

	# Install Puppet Packer plugin
	packer plugins install github.com/hashicorp/puppet

	# Install Docker Packer plugin
	packer plugins install github.com/hashicorp/docker

deps-upgrade:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements-dev.txt)
	$(call python_venv,pip-compile --upgrade)

rmdeps:
	rm -rf .venv

lint:
	$(call python_venv,yamllint \
		conf/ansible/inventory/group_vars/*.yaml \
		provisioners/ansible/playbooks/*.yaml)
	$(call python_venv,actionlint -shellcheck= .github/workflows/*.yaml)
	puppet-lint \
		--fail-on-warnings \
		--no-documentation-check \
		provisioners/puppet/*.pp
	shellcheck \
		provisioners/shell/*.sh
	mdl README.md

build-docker-base:
	$(call python_venv,PACKER_TMP_DIR=/tmp scripts/run-playbook-stack.sh build "${config_path}" base "$(arch)")

publish-docker-base:
	$(call python_venv,scripts/run-playbook-stack.sh publish "${config_path}" base "$(arch)")

# Combine the per-architecture images into multi-arch version and latest tags
publish-docker-base-manifest:
	$(call python_venv,scripts/run-playbook-stack.sh publish-manifest "${config_path}" base)

release-major:
	rtk release --release-increment-type major

release-minor:
	rtk release --release-increment-type minor

release-patch:
	rtk release --release-increment-type patch

release: release-minor

.PHONY: ci clean init deps lint build-docker-base publish-docker-base publish-docker-base-manifest release release-major release-minor release-patch
