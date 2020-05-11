#!/usr/bin/env bash
set -o nounset
set -o errexit

# Info
/opt/puppetlabs/puppet/bin/ruby --version
/opt/puppetlabs/puppet/bin/gem --version
/opt/puppetlabs/puppet/bin/puppet --version
/opt/puppetlabs/puppet/bin/facter --version
/opt/puppetlabs/puppet/bin/hiera --version
/opt/puppetlabs/pdk/bin/pdk --version
