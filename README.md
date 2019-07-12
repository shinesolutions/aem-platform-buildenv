[![Build Status](https://img.shields.io/travis/shinesolutions/aem-platform-buildenv.svg)](http://travis-ci.org/shinesolutions/aem-platform-buildenv)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/shinesolutions/aem-platform-buildenv.svg)](https://hub.docker.com/r/shinesolutions/aem-platform-buildenv/)
[![Known Vulnerabilities](https://snyk.io/test/github/shinesolutions/aem-platform-buildenv/badge.svg)](https://snyk.io/test/github/shinesolutions/aem-platform-buildenv)

AEM Platform BuildEnv
---------------------

AEM Platform BuildEnv is a Docker-based environment for building [AEM OpenCloud repositories](https://github.com/topics/aem-opencloud). The Docker image already contains the software required to run all build targets from those repositories.

Installation
------------

Pull AEM Platform BuildEnv Docker image from Docker Hub:

    docker pull shinesolutions/aem-platform-buildenv

Or alternatively, you can create the Docker image:

    # Install Hashicorp packer tool for your OS
    https://www.packer.io/intro/getting-started/install.html

    # Install Ruby bundler module (may require sudo)
    gem install bundler --conservative

    git clone https://github.com/shinesolutions/aem-platform-buildenv

    cd aem-platform-buildenv
    make deps
    make docker-base

Usage
-----

Run a Docker container from the repository directory:
(you might want to create an alias for the lengthy command below)

    docker run \
      --rm \
      --workdir /opt/workspace \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v `pwd`:/opt/workspace \
      -i -t shinesolutions/aem-platform-buildenv

You can also run the command without `--rm` flag if you want to keep the container along with the downloaded tools and dependencies.

Please note that the above image does not contain any credential. It's up to you to set up your AWS/SCM/etc credentials.

AWS ECR
-------

Starting from AEM Platform BuildEnv 1.0.0, it's possible to use AWS ECR as an alternative to Docker Hub as Docker registry.

1. Create [ECR repository](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html) named `aem-platform-buildenv`
2. Create [configuration file](https://github.com/shinesolutions/aem-platform-buildenv/blob/master/docs/configuration.md) `aws.region` and `docker.repository`
3. Create Docker image by running `make docker-base config_path=<path/to/config/dir>`
4. Publish Docker image by running `make publish-base config_path=<path/to/config/dir>`
