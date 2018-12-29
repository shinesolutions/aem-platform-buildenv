class { 'cred::aws':
}

include pip
pip::install { 'aws-google-auth':
  ensure         => present,
  python_version => '2.7',
}

class { 'cred::profile':
}
