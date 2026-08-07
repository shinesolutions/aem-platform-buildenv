[![Build Status](https://github.com/shinesolutions/aem-platform-buildenv/workflows/CI/badge.svg)](https://github.com/shinesolutions/aem-platform-buildenv/actions?query=workflow%3ACI)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/shinesolutions/aem-platform-buildenv.svg)](https://hub.docker.com/r/shinesolutions/aem-platform-buildenv/)
[![Known Vulnerabilities](https://snyk.io/test/github/shinesolutions/aem-platform-buildenv/badge.svg)](https://snyk.io/test/github/shinesolutions/aem-platform-buildenv)

# AEM Platform BuildEnv

AEM Platform BuildEnv is a Docker-based environment for building [AEM OpenCloud repositories](https://github.com/topics/aem-opencloud). The Docker image already contains the software required to run all build targets from those repositories.

## Installation

Pull AEM Platform BuildEnv Docker image from Docker Hub:

```shell
docker pull shinesolutions/aem-platform-buildenv
```

Or alternatively, you can create the Docker image:

```shell
# Install Hashicorp packer tool for your OS
https://www.packer.io/intro/getting-started/install.html

git clone https://github.com/shinesolutions/aem-platform-buildenv

cd aem-platform-buildenv
make deps
make build-docker-base
```

## Usage

Run a Docker container from the repository directory:

```shell
docker run \
    --rm \
    --workdir /opt/workspace \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v `pwd`:/opt/workspace \
    -i -t shinesolutions/aem-platform-buildenv
```

You can also run the command without `--rm` flag if you want to keep the container along with the downloaded tools and dependencies.

Please note that the above image does not contain any credential. It's up to you to set up your AWS/SCM/etc credentials and then mount the corresponding path to the container.

## AWS ECR

Starting from AEM Platform BuildEnv 1.0.0, it's possible to use AWS ECR as an alternative to Docker Hub as Docker registry.

1. Create [ECR repository](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html) named `aem-platform-buildenv`
2. Create [configuration file](https://github.com/shinesolutions/aem-platform-buildenv/blob/master/docs/configuration.md) `aws.region` and `docker.repository`
3. Create Docker image by running `make docker-base config_path=<path/to/config/dir>`
4. Publish Docker image by running `make publish-base config_path=<path/to/config/dir>`

## x86-64-v3 microarchitecture

Starting from AEM Platform BuildEnv 5.0.0, the containers are built with Rocky Linux 10 which mandates x86-64-v3 microarchitecture level.

If you are using Colima, you need to add these flags `--arch x86_64 --cpu-type "max,+avx,+avx2"` when running Colima.
