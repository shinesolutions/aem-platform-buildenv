class cred::puppet(
  $base_dir,
) {

  # Opt-out of PDK analytics data collection
  file { "${base_dir}/.config":
    ensure => 'directory',
  } -> file { "${base_dir}/.config/puppet":
    ensure => 'directory',
  } -> file { "${base_dir}/.config/puppet/analytics.yml":
    ensure  => file,
    content => 'disabled: true',
  }

}
