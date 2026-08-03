class { '::phantomjs':
  package_version => '2.1.1',
  package_update  => true,
  install_dir     => '/usr/local/bin',
  source_dir      => '/opt',
  timeout         => 600,
}

# Install Python dependencies
package { 'awscli':
  ensure   => '1.45.62',
  provider => 'pip3',
}
package { 'boto':
  ensure   => '2.49.0',
  provider => 'pip3',
}
package { 'boto3':
  ensure   => '1.43.62',
  provider => 'pip3',
}
package { 'botocore':
  ensure   => '1.43.62',
  provider => 'pip3',
}
package { 'jinja2':
  ensure   => '3.1.6',
  provider => 'pip3',
}
package { 'pylint':
  ensure   => '4.0.6',
  provider => 'pip3',
}
package { 'ruamel.yaml':
  ensure   => '0.19.1',
  provider => 'pip3',
}
package { 'yamllint':
  ensure   => '1.38.0',
  provider => 'pip3',
}

# Install Ruby dependencies
package { 'aws-sdk-core':
  ensure   => '3.254',
  provider => 'puppet_gem',
}
package { 'jsonlint':
  ensure   => '0.4.0',
  provider => 'puppet_gem',
}
package { 'puppet-lint':
  ensure   => '5.1.1',
  provider => 'puppet_gem',
}
package { 'faraday-net_http':
  ensure   => '3.4.4',
  provider => 'puppet_gem',
}
package { 'faraday':
  ensure   => '2.14.3',
  provider => 'puppet_gem',
}
package { 'r10k':
  ensure   => '5.0.3',
  provider => 'puppet_gem',
}
package { 'rubocop':
  ensure   => '1.88.2',
  provider => 'puppet_gem',
}
package { 'yaml-lint':
  ensure   => '0.1.2',
  provider => 'puppet_gem',
}
package { 'rake':
  ensure   => '13.4.2',
  provider => 'puppet_gem',
}
package { 'ruby_aem':
  ensure   => '3.17',
  provider => 'puppet_gem',
}
package { 'ruby_aem_aws':
  ensure   => '3.0.0',
  provider => 'puppet_gem',
}
package { 'nokogiri':
  ensure   => '1.19.4',
  provider => 'puppet_gem',
}
package { 'nori':
  ensure   => '2.9.1',
  provider => 'puppet_gem',
}
package { 'public_suffix':
  ensure   => '7.0.5',
  provider => 'puppet_gem',
}
package { 'mixlib-log':
  ensure   => '3.2.3',
  provider => 'puppet_gem',
}
package { 'excon':
  ensure   => '1.6',
  provider => 'puppet_gem',
}
package { 'ffi':
  ensure   => '1.17.4',
  provider => 'puppet_gem',
}
package { 'train':
  ensure   => '3.16.5',
  provider => 'puppet_gem',
  require  => Package['excon'],
}
package { 'inspec':
  ensure   => '7.1.7',
  provider => 'puppet_gem',
  require  => [Package['ffi'], Package['mixlib-log']],
}
package { 'capybara':
  ensure   => '3.40.0',
  provider => 'puppet_gem',
}
package { 'file_utils':
  ensure   => '1.1.2',
  provider => 'puppet_gem',
}
package { 'rspec':
  ensure   => '3.13.2',
  provider => 'puppet_gem',
}
package { 'poltergeist':
  ensure   => '1.18.1',
  provider => 'puppet_gem',
}
package { 'bundler':
  ensure   => '4.0.17',
  provider => 'puppet_gem',
}
