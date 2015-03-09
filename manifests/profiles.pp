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
}

class profile::devops {

}

class profile::devops::mypacker inherits profile::devops {

    class { 
	'packer':
    } ->
    file { '/usr/bin/packer':
	ensure => 'link',
	target => '/usr/local/bin/packer',
    }
}

class profile::webserver {
    include nginx
}

class profile::webserver::dev inherits profile::webserver {
    # special sauce
}


