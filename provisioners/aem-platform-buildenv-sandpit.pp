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
# awscli 1.16.10 has requirement botocore==1.12.0, but you'll have botocore 1.11.9 which is incompatible.
# May need to change boto3 to 1.8.6 and botocore to 1.12.0 later.
} -> pip::install { 'botocore':
  ensure         => present,
  version        => '1.11.9', # most recent 1.11.x required by aws-google-auth due to range < 1.12,
  python_version => '2.7',
} -> pip::install { 'boto3':
  ensure         => present,
  version        => '1.8.5',
  python_version => '2.7',
}

class { 'cred::google':
}
