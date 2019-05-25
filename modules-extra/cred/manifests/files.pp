class cred::files(
  $base_dir,
  $gpg_source,
) {

  file { "${base_dir}/.gnupg":
    purge => true,
  } -> archive { "${base_dir}/":
    ensure  => present,
    source  => $gpg_source,
    extract => true,
    extract_path => $base_dir,
    cleanup => false,
  }

}
