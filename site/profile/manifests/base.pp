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

    vcsrepo { '/etc/vim/.vim':
    	ensure  => latest,
	provider => git,
	source => 'https://github.com/damc-dev/.vim.git'
    } -> file { '/etc/vim/vimrc.local':
    	ensure => 'link',
	target => '/etc/vim/.vim/vimrc',
	require => File['/etc/vim/.vim/vimrc']
    }

}
