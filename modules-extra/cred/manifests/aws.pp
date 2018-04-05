class cred::aws(
  $base_dir,
  $aws_access_key_id,
  $aws_secret_access_key,
) {

  file { "${base_dir}/.aws/":
    ensure  => directory,
  } -> file { "${base_dir}/.aws/credentials":
    ensure  => present,
    content => epp('cred/aws_credentials.epp', {
      aws_access_key_id     => $aws_access_key_id,
      aws_secret_access_key => $aws_secret_access_key,
    }),
    mode    => '0644',
  }

}
