class { 'cred::aws':
}

package { ['libusbx-devel', 'libudev-devel']:
  ensure   => 'present',
  provider => 'yum',
}

include pip
pip::install { 'aws-google-auth[u2f]':
  ensure         => present,
  python_version => '2.7',
} -> pip::install { 'botocore':
  ensure         => present,
  version        => '1.11.9', # most recent 1.11.x required by aws-google-auth due to range < 1.12
  python_version => '2.7',
}

class { 'cred::google':
}
