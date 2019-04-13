class { 'nodejs':
  repo_url_suffix       => '8.x',
  nodejs_package_ensure => '8.10.0',

# nestor is used for triggering and integration testing AEM OpenCloud Manager
# Jenkins pipelines, it is written in node.js, and we ended up using this
# because there was no Python-based Jenkins CLI that works with Jenkins crumb.
} -> package { 'nestor':
  ensure   => '2.2.0',
  provider => 'npm',

# open-sesame is used as a convenient utility tool for allowing inbound rule
# from the public IP where the engineer is working from, it's only used for
# build and development purposes
} -> package { 'open-sesame':
  ensure   => '1.1.0',
  provider => 'npm',

# putasset is used for publishing artifacts to GitHub releases
} -> package { 'putasset':
  ensure   => '4.3.1',
  provider => 'npm',

# rtk is used for automating repo release process (versioning, tagging)
} -> package { 'rtk':
  ensure   => '0.1.0',
  provider => 'npm',
}


package { ['git', 'ShellCheck', 'unzip', 'wget', 'docker', 'jq', 'python-devel']:
  ensure   => 'present',
  provider => 'yum',
}

include pip
pip::install { 'ansible':
  ensure         => present,
  version        => '2.5.8',
  python_version => '2.7',
}
pip::install { 'awscli':
  ensure         => present,
  version        => '1.16.133',
  python_version => '2.7',
}

class { 'hashicorp::packer':
  version => '1.2.4',
}

archive { '/usr/local/bin/packer-post-processor-json-updater':
  source => 'https://github.com/cliffano/packer-post-processor-json-updater/releases/download/v1.2/packer-post-processor-json-updater_linux_amd64',
} -> file { '/usr/local/bin/packer-post-processor-json-updater':
  ensure => 'file',
  mode   => '0755',
}

class { '::phantomjs':
  package_version => '1.9.7',
  package_update  => true,
  install_dir     => '/usr/local/bin',
  source_dir      => '/opt',
  timeout         => 600,
}

class { 'java':
  distribution => 'jdk',
}

class { 'maven::maven':
  version => '3.5.0',
}
