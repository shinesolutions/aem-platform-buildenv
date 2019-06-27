ci: clean deps lint docker-base docker-sandpit

clean:
	rm -rf logs modules

init:
	mkdir -p artifacts

deps:
	gem install bundler
	bundle install
	r10k puppetfile install --moduledir modules --verbose
	pip install --user -r requirements.txt

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

docker-base:
	scripts/run-playbook-stack.sh build "${config_path}" base

docker-sandpit:
	scripts/run-playbook-stack.sh build "${config_path}" sandpit

docker-publisher:
	scripts/run-playbook-stack.sh build "${config_path}" publisher

publish-base:
	scripts/run-playbook-stack.sh publish "${config_path}" base

publish-sandpit:
	scripts/run-playbook-stack.sh publish "${config_path}" sandpit

publish-publisher:
	scripts/run-playbook-stack.sh publish "${config_path}" publisher

release:
	rtk release
	
.PHONY: ci clean init deps lint docker-base docker-sandpit docker-publisher publish-base publish-sandpit release
