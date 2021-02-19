class { '::phantomjs':
  package_version => '1.9.7',
  package_update  => true,
  install_dir     => '/usr/local/bin',
  source_dir      => '/opt',
  timeout         => 600,
}

exec { 'pip3 install --upgrade pip==21.0.1':
path => ['/bin', '/usr/local/bin', '/usr/bin'],
}
package{ 'boto3':
  ensure   => '1.17.8',
  provider => pip3,
}
package{ 'awscli':
  ensure   => '1.19.8',
  provider => pip3,
}
