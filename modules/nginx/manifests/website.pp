# Cria um definition type

define nginx::website ( $site_domain ) {

# Inclui a classe do nginx
include nginx

# Declara o valor da variável site_name que receberá o valor de cat-pictures (valor do nome do resource type)
$site_name = $name

# Declara que dentro de conf.d/ deve haver o um arquivo com o valor da variavel .conf , buscando do template
file { "/etc/nginx/conf.d/${site_name}.conf":
	content => template('nginx/vhost.conf.erb'),
	notify	=> Service['nginx'],
}

# Deve criar o diretório /var/www/ de acordo com o nome da variavel
file { "/var/www/${name}":
	ensure 	=> 'directory',
	recurse	=> true,
}

}
