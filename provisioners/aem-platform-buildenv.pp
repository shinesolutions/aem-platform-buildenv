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
package { 'rake':
  ensure   => '12.3.3',
  provider => 'puppet_gem',
}
package { 'ruby_aem':
  ensure   => '3.13.1',
  provider => 'puppet_gem',
}
package { 'ruby_aem_aws':
  ensure   => '2.2.1',
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
  ensure   => '1.17.3',
  provider => 'puppet_gem',
}
