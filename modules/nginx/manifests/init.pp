# Classe para instalação do nginx
class nginx { 
	package { 'httpd': 
		ensure => absent,
	}
	package { 'nginx': 
		ensure => installed,
		require => Package['httpd'],
	}
	service { 'nginx': 
		ensure => running, 
		require => Package['nginx'], 
		enable => true,
	}
	file 	{ '/etc/nginx/default.d/default': 
		ensure => absent, 
	}
}
