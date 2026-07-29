#!/usr/bin/env bash
set -o nounset
set -o errexit

echo 'Upgrading pip3 to latest version'
/usr/bin/python3 -m pip install --upgrade pip

echo 'Installing Ansible'
/usr/local/bin/pip3 install -q ansible==4.8.0
