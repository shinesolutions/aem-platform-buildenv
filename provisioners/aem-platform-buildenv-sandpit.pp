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
}

class { 'cred::google':
}
