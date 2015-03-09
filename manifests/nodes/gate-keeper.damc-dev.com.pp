node 'gate-keeper.damc-dev.com' inherits basenode {
    include role::www::dev

    file { '/var/www':
	ensure => 'directory', 
    } ->
    file { '/var/www/damc-dev.com':
	ensure => 'directory', 
    } ->
    file { '/var/www/damc-dev.com/index.html':
	ensure => file,
	source => 'puppet:///modules/nginx/helloworld.html',
	require => [
	    Package['nginx'],
	    File['/var/www/damc-dev.com']
	],
    } ->
    nginx::resource::vhost { 'www.damc-dev.com':
	ensure   => present,
	mode => 0644,
        www_root => '/var/www/damc-dev.com',
	require => [
	    Package['nginx'],
	],
    }
}
