class { '::phantomjs':
  package_version => '1.9.7',
  package_update  => true,
  install_dir     => '/usr/local/bin',
  source_dir      => '/opt',
  timeout         => 600,
}

# Install Python dependencies
package { 'awscli':
  ensure   => '1.22.1',
  provider => 'pip3',
}
package { 'boto':
  ensure   => '2.49.0',
  provider => 'pip3',
}
package { 'boto3':
  ensure   => '1.20.0',
  provider => 'pip3',
}
package { 'botocore':
  ensure   => '1.23.1',
  provider => 'pip3',
}
package { 'jinja2':
  ensure   => '2.11.3',
  provider => 'pip3',
}
package { 'pylint':
  ensure   => '2.6.0',
  provider => 'pip3',
}
package { 'ruamel.yaml':
  ensure   => '0.16.5',
  provider => 'pip3',
}
package { 'yamllint':
  ensure   => '1.19.0',
  provider => 'pip3',
}

# Install Ruby dependencies
package { 'aws-sdk-core':
  ensure   => '3.50.0',
  provider => 'puppet_gem',
}
package { 'jsonlint':
  ensure   => '0.3.0',
  provider => 'puppet_gem',
}
package { 'puppet-lint':
  ensure   => '2.5.2',
  provider => 'puppet_gem',
}
package { 'faraday-net_http':
  ensure   => '3.0.2',
  provider => 'puppet_gem',
}
package { 'faraday':
  ensure   => '2.8.1',
  provider => 'puppet_gem',
}
package { 'r10k':
  ensure   => '3.15.1',
  provider => 'puppet_gem',
}
package { 'rubocop':
  ensure   => '1.35.1',
  provider => 'puppet_gem',
}
package { 'yaml-lint':
  ensure   => '0.0.10',
  provider => 'puppet_gem',
}
package { 'rake':
  ensure   => '13.0.6',
  provider => 'puppet_gem',
}
package { 'ruby_aem':
  ensure   => '3.16.1',
  provider => 'puppet_gem',
}
package { 'ruby_aem_aws':
  ensure   => '3.0.0',
  provider => 'puppet_gem',
}
package { 'nokogiri':
  ensure   => '1.15.6',
  provider => 'puppet_gem',
}
package { 'nori':
  ensure   => '2.6.0',
  provider => 'puppet_gem',
}
package { 'winrm':
  ensure   => '2.3.6',
  provider => 'puppet_gem',
}
package { 'public_suffix':
  ensure   => '5.1.1',
  provider => 'puppet_gem',
}
package { 'train':
  ensure   => '0.32.0',
  provider => 'puppet_gem',
}
package { 'inspec':
  ensure   => '1.51.6',
  provider => 'puppet_gem',
}
package { 'capybara':
  ensure   => '3.30.0',
  provider => 'puppet_gem',
}
package { 'file_utils':
  ensure   => '1.1.2',
  provider => 'puppet_gem',
}
package { 'rspec':
  ensure   => '3.8.0',
  provider => 'puppet_gem',
}
package { 'poltergeist':
  ensure   => '1.18.1',
  provider => 'puppet_gem',
}
package { 'bundler':
  ensure   => '2.3.21',
  provider => 'puppet_gem',
}
