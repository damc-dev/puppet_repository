class profile::sshd {

  service { 'sshd':
    ensure => 'running',
    enable => true,
  }

  file { '/etc/ssh/sshd_config':
    notify => Service['sshd'],
    ensure  => file,
    source  => 'puppet:///modules/profile/sshd_config'
    mode    => '600',
    owner   => 'root',
    group   => 'root',
  }
}
