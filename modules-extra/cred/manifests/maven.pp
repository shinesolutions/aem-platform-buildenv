class cred::maven(
  $sonatype_username,
  $sonatype_password,
  $gpg_keyname,
  $gpg_passphrase,
) {

  $sonatype_snapshot = {
    id       => 'sonatype-snapshot',
    username => $sonatype_username,
    password => $sonatype_password,
  }

  $sonatype_release = {
    id       => 'sonatype-release',
    username => $sonatype_username,
    password => $sonatype_password,
  }

  class { 'maven::maven':
    version => '3.2.5',
  } -> maven::settings { 'maven-user-settings' :
    servers    => [$sonatype_snapshot, $sonatype_release],
    profiles   => {
      'sign-artifacts' => {
        'activation' => {
          'activeByDefault' => true,
        },
        properties => {
          'gpg.executable' => 'gpg',
          'gpg.keyname'    => $gpg_keyname,
          'gpg.passphrase' => $gpg_passphrase,
        },
      },
    },
  }

}
