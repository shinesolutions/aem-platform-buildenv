#!/usr/bin/env bash
set -o nounset
set -o errexit

yum -y install libffi-devel

# Info
/opt/puppetlabs/puppet/bin/ruby --version
/opt/puppetlabs/puppet/bin/gem --version
/opt/puppetlabs/puppet/bin/puppet --version
/opt/puppetlabs/puppet/bin/facter --version
/opt/puppetlabs/pdk/bin/pdk --version
