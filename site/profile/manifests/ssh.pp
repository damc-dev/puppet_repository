class profile::ssh {
  file { '/software/ssh':
    ensure => 'directory',
    mode   => '700',
    owner  => 'root',
    group  => 'root',
  }
}
