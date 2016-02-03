class profile::base {
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
   
    file { '/etc/vim/vimrc.local':
    	ensure => file,
	    source => 'puppet:///modules/profile/vimrc',
      mode   => '0755'
    }
}
