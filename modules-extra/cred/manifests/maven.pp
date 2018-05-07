class cred::maven(
  $sonatype_username,
  $sonatype_password,
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
    servers => [$sonatype_snapshot, $sonatype_release],
  }

}
