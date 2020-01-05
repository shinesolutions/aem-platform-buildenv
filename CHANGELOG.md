# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 1.3.0 - 2020-01-05
### Changed
- Upgrade Ansible to 2.9.2
- Upgrade AWS CLI to 1.16.304
- Upgrade Packer to 1.5.1

## 1.2.0 - 2019-12-31
### Added
- Add github-release-downloader(grd) for downloading private GitHub repos using OAuth token

### Changed
- Specify local source for docker_image publishing due to Ansible dropping auto-detection

## 1.1.0 - 2019-08-16
### Changed
- Upgrade Ansible to 2.8.2
- Disable PDK analytics collection

### Fixed
- Fix docker version tag for publisher and sandpit

## 1.0.0 - 2019-07-01
### Added
- Add ECR repository support [#4]
- Parameterise timezone

### Changed
- Use Makefile version as release version source of truth

## 0.11.0 - 2019-05-26
### Changed
- Upgrade rtk to 0.2.0
- Upgrade node.js to 10.15.3
- Upgrade Ansible to 2.7.10
- Upgrade AWS CLI to 1.16.115
- Cleanup previous gnupg before provisioning new one on publisher image
- Replace aem-platform-buildenv-publisher source to be aem-platform-buildenv

## 0.10.0 - 2019-05-09
### Added
- Add node packages: nestor and putasset

## 0.9.0 - 2019-03-12
### Added
- Initial version
