[![Build Status](https://img.shields.io/travis/shinesolutions/aem-platform-buildenv.svg)](http://travis-ci.org/shinesolutions/aem-platform-buildenv)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/shinesolutions/aem-platform-buildenv.svg)](https://hub.docker.com/r/shinesolutions/aem-platform-buildenv/)

Packer aem-platform-buildenv
---------------

Packer aem-platform-buildenv is a ...

Installation
------------

Pull aem-platform-buildenv Docker image from Docker Hub:

    docker pull shinesolutions/aem-platform-buildenv

Or alternatively, you can create the Docker image:

    git clone https://github.com/shinesolutions/aem-platform-buildenv
    cd aem-platform-buildenv
    make docker

Usage
-----

    docker run \
      --workdir /opt/workspace \
      -v $(pwd):/opt/workspace \
      -t shinesolutions/aem-platform-buildenv \
      --rm \
      aem-platform-buildenv \
      --jar /opt/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar \
      --api-spec path/to/spec.yml \
      javascript-gen
