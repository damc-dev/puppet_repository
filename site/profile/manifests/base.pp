class profile::base {
  
  $users = [
    { 
      'user'     => 'david',
      'realName' => 'David McElligott',
      'authorizedKeys'   => ['ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFsMHpX+9b1fCr+IKKWG+3HoBA8ToN+CLZ2Eb3tvP1TZt/o5JVj4pmEFF9Um1f25RZIiZ4lGbm8kfliy6R+/WNh3Wm83e/qPwevD6DDPDN7/nyb5q2VzpkUj1Y0Ov21EwVs5nWwkQJrEn11qGjO7ndXPRR+48p4Xo6CpAulL5CD2yoCG/kZhUCf5ajIml4/99tEzFWpmdtDpbus7mXeLmxW9z5JhOHUuxMy0wqr1OeiYD0nYBErpOVIryHTz4LO0kSJbts2vNoORm7mjLmoVFLJpKltlFPQQAnfjsYlSgFVTMZUwZ6+CthKVAQXtsEbG0+YyQZHZzszmBJcxq/BQcl damc.dev@gmail.com'],
    }
  ]

    include 
	git,
	vim,
	sudo,
	'::ntp'

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

    $users.each |Hash $user| {
      notify {"Creating user $user":}
    }
}
