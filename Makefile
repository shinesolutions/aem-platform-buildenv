ci: clean deps lint build-docker-base

clean:
	rm -rf logs modules

init:
	mkdir -p artifacts

deps:
	gem install bundler --version=1.17.3
	bundle install -j4
	r10k puppetfile install --moduledir modules --verbose
	pip install -r requirements.txt

lint:
	yamllint \
		conf/ansible/inventory/group_vars/*.yaml \
		provisioners/ansible/playbooks/*.yaml
	puppet-lint \
		--fail-on-warnings \
		--no-documentation-check \
		provisioners/*.pp
	shellcheck \
		provisioners/*.sh

build-docker-base:
	PACKER_TMP_DIR=/tmp scripts/run-playbook-stack.sh build "${config_path}" base

publish-docker-base:
	scripts/run-playbook-stack.sh publish "${config_path}" base

release-major:
	rtk release --release-increment-type major

release-minor:
	rtk release --release-increment-type minor

release-patch:
	rtk release --release-increment-type patch

release: release-minor

.PHONY: ci clean init deps lint build-docker-base publish-docker-base release release-major release-minor release-patch
