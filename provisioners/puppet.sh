#!/usr/bin/env bash
set -o nounset
set -o errexit
PUPPET_MAJOR_VERSION=7
PUPPET_MINOR_VERSION=9
PUPPET_PATCH_VERSION=0
PUPPET_AGENT_VERSION="${PUPPET_MAJOR_VERSION}.${PUPPET_MINOR_VERSION}.${PUPPET_PATCH_VERSION}"
ARCH_TYPE=x86_64
OS_TYPE=el
OS_VERSION=7

if [[ "$(/opt/puppetlabs/puppet/bin/puppet --version)" == "${PUPPET_AGENT_VERSION}" ]]
then
    echo "Puppet version ${PUPPET_AGENT_VERSION} is already installed. Skipping Puppet installation..."
else
    echo "Installing puppet ${PUPPET_AGENT_VERSION}..."
    yum -y install "https://yum.puppetlabs.com/puppet${PUPPET_MAJOR_VERSION}/${OS_TYPE}/${OS_VERSION}/${ARCH_TYPE}/puppet-agent-${PUPPET_AGENT_VERSION}-1.${OS_TYPE}${OS_VERSION}.${ARCH_TYPE}.rpm"
fi

# Info
/opt/puppetlabs/puppet/bin/ruby --version
/opt/puppetlabs/puppet/bin/gem --version
/opt/puppetlabs/puppet/bin/puppet --version
/opt/puppetlabs/puppet/bin/facter --version
/opt/puppetlabs/puppet/bin/hiera --version
/opt/puppetlabs/pdk/bin/pdk --version
