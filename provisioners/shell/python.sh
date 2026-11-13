#!/usr/bin/env bash
set -o nounset
set -o errexit

echo 'Upgrading pip3 to latest version'
/usr/bin/python3 -m pip install --upgrade pip

echo 'Installing Ansible'
# The AEM OpenCloud repos use this Ansible instead of installing their own, so
# keep these pins in line with the versions those repos were tested against
/usr/local/bin/pip3 install -q ansible==14.5.0 ansible-core==2.21.5
