class cred::google(
  $base_dir,
  $google_idp_id,
  $google_sp_id,
) {

  file_line { 'Set awsgoogleauth alias for generating AWS STS token from Google SSO':
    path => "${base_dir}/.bashrc",
    line => "alias gsso2aws='aws-google-auth --idp-id ${$google_idp_id} --sp-id ${$google_sp_id} --profile default --save-failure-html'",
  }
}
