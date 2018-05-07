ci: clean tools deps lint docker docker-sandpit docker-publisher

clean:
	rm -rf logs modules

init:
	mkdir -p artifacts

deps:
	r10k puppetfile install --moduledir modules --verbose

tools:
	gem install puppet-lint r10k

lint:
	puppet-lint \
		--fail-on-warnings \
		--no-documentation-check \
		provisioners/*.pp
	shellcheck \
		provisioners/*.sh

docker:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/aem-platform-buildenv.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker.json

docker-sandpit:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/aem-platform-buildenv-sandpit.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-sandpit.json

docker-publisher:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/aem-platform-buildenv-publisher.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-publisher.json

publish:
	docker push shinesolutions/aem-platform-buildenv:latest

.PHONY: ci clean init deps tools docker docker-sandpit docker-publisher publish
