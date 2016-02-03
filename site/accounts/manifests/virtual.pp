define accounts::virtual ($uid,$realName,$sshKey,$sshKeyType) {
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
    file { "/software/ssh/${title}":
      ensure  => directory,
      owner             =>  $title,
      group             =>  $title,
      mode              =>  0750,
      require           =>  [ User[$title], Group[$title], File["/software/ssh"] ],
    }

    ssh_authorized_key { $title:
      target  => "/software/ssh/${title}/authorized_keys",
      ensure  => present,
      name    => $title,
      user    => $title,
      type    => $sshKeyType,
      key     => $sshKey,
      require => File["/software/ssh/${title}"],
    }


    file { "/home/${title}/.ssh":
      ensure  => directory,
      owner             =>  $title,
      group             =>  $title,
      mode              =>  0750,
      require           =>  [ User[$title], Group[$title] ],
    }

    ssh_authorized_key { $title:
      target => "/software/ssh/${title}/authorized_keys",
      ensure => present,
      name   => $title,
      user   => $title,
      type   => $sshKeyType,
      key    => $sshKey,
      require => File["/home/${title}/.ssh"],
    }
  }
}
