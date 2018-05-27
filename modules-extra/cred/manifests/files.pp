class cred::files(
  $base_dir,
  $gpg_source,
) {

  archive { "${base_dir}/":
   source  => $gpg_source,
   extract => true,
  }

}
