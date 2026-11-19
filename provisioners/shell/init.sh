#!/usr/bin/env bash
set -o nounset
set -o errexit

# Update all base packages
dnf -y update && dnf clean all

# Install packages for downstream dependencies and operational toolings
yum -y install libffi-devel dos2unix

# Info
/opt/puppetlabs/puppet/bin/ruby --version
/opt/puppetlabs/puppet/bin/gem --version
/opt/puppetlabs/puppet/bin/puppet --version
/opt/puppetlabs/puppet/bin/facter --version
dos2unix --version | head -1
