#!/usr/bin/env bash
set -o nounset
set -o errexit

rpm -ivh --force https://yum.puppetlabs.com/puppet5/puppet-release-el-7.noarch.rpm
yum -y install puppet-agent epel-release
yum -y groupinstall 'Development Tools'

# Enable the rhui-REGION-rhel-server-optional to install ruby-devel
rpm -ivh --force https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum-config-manager --enable rhui-REGION-rhel-server-optional
yum -y install which make python-devel ruby-devel zlib-devel

# Info
/opt/puppetlabs/puppet/bin/ruby --version
/opt/puppetlabs/puppet/bin/gem --version
/opt/puppetlabs/puppet/bin/puppet --version
/opt/puppetlabs/puppet/bin/facter --version
/opt/puppetlabs/puppet/bin/hiera --version
