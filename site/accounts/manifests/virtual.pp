define accounts::virtual (
  $uid,
  $realName,
  $sshKey,
  $sshKeyType,
) {
  $sshDir = "/home/${title}/.ssh"
  
  user { $title:
    ensure            =>  'present',
    uid               =>  $uid,
    gid               =>  $title,
    shell             =>  '/bin/bash',
    home              =>  "/home/${title}",
    comment           =>  $realName,
    managehome        =>  true,
    require           =>  Group[$title],
  }

  group { $title:
    gid               =>  $uid,
  }

  file { "/home/${title}":
    ensure            =>  directory,
    owner             =>  $title,
    group             =>  $title,
    mode              =>  0750,
    require           =>  [ User[$title], Group[$title] ],
  }

  if ($sshKey != '') {
    file { "${sshDir}":
      ensure  => directory,
      owner             =>  $title,
      group             =>  $title,
      mode              =>  0750,
      require           =>  [ User[$title], Group[$title] ],
    }

    ssh_authorized_key { $title:
      target  => "${sshDir}/authorized_keys",
      ensure  => present,
      name    => $title,
      user    => $title,
      type    => $sshKeyType,
      key     => $sshKey,
      require => File["${sshDir}"],
    }
 }
}
