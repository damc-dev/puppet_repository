class profile::base {
  
  include 
	  git,
	  vim,
	  sudo,
	  '::ntp',
    accounts,
    '::auditd'

  realize (Accounts::Virtual['test_user'])

  git::config { 'user.name':
      value => 'David McElligott',
      require => Package['git'],
  }

  git::config { 'user.email':
      value => 'damc.dev@gmail.com',
      require => Package['git'],
  }

  file { '/software':
    ensure => 'directory',
    mode => '0755',
  }

  file { '/logs':
    ensure => 'directory',
    mode => '0755',
  }
 
  file { '/etc/vim/vimrc.local':
    ensure => file,
    source => 'puppet:///modules/profile/vimrc',
    mode   => '0755',
  }
}
