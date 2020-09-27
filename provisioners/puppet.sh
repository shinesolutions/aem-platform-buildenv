#!/usr/bin/env bash
set -o nounset
set -o errexit

rpm -ivh --force https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
yum -y install puppet-agent-5.5.21 || echo $?

# Info
/opt/puppetlabs/puppet/bin/ruby --version
/opt/puppetlabs/puppet/bin/gem --version
/opt/puppetlabs/puppet/bin/puppet --version
/opt/puppetlabs/puppet/bin/facter --version
/opt/puppetlabs/puppet/bin/hiera --version
/opt/puppetlabs/pdk/bin/pdk --version
