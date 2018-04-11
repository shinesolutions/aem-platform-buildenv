class cred::rubygems(
  $base_dir,
  $rubygems_api_key,
) {

  file { "${base_dir}/.gem/":
    ensure  => directory,
  } -> file { "${base_dir}/.gem/credentials":
    ensure  => present,
    content => epp('cred/gem_credentials.epp', {
      rubygems_api_key => $rubygems_api_key,
    }),
    mode    => '0600',
  }

}
