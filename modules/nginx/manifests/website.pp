#Gerenciado pelo puppet

define nginx::website ( $site_domain ) {
include nginx
$site_name = $name
file { "/etc/nginx/conf.d/${site_name}.conf":
	content => template('nginx/vhost.conf.erb'),
	notify	=> Service['nginx'],
}
file { "/var/www/${name}":
	ensure 	=> 'directory',
	recurse	=> true,
}
}
