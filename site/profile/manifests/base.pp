class profile::base {
  
  include 
	  git,
	  vim,
	  sudo,
	  '::ntp',
    accounts

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

  package { 'auditd':
    ensure => 'present',
    name   => 'auditd',
    before => File['/etc/audit/audit.rules'],
  }

  file { '/etc/audit/audit.rules':
    ensure => file,
    source => 'puppet:///modules/profile/audit.rules',
    owner  => 'root',
    group  => 'root',
    mode   => '600',
  }

  service {'auditd':
    ensure    => 'running',
    enable    => true,
    hasstatus => true,
    subscribe => File[ '/etc/audit/audit.rules'],
  }

  package {'rsyslog':
    ensure => 'present',
    name   => 'rsyslog',
  }

  file {'/etc/rsyslog.d/ssh_auditd':
    ensure => file,
    source => 'puppet:///modules/profile/rsyslogd_ssh_auditd',
    owner  => 'root',
    group  => 'root',
    mode   => '440',
  }

  service {'rsyslog': 
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    subscribe  => File['/etc/rsyslog.d/ssh_auditd'],
  }
}
