# CONFIGURANDO IP FIXO
	
define base::rede ( $nome_interface ) {
include base

#if $ipaddress == '192.168.0.100' {

if $ipaddress == undef {

	notify { 'Não recebi IP =(': }

}
else {

	file	{ "/etc/sysconfig/network-scripts/ifcfg-${nome_interface}":
		content	=> template('base/network.conf.erb'),
		notify	=> Service['network']
}
	service	{ 'network':
		ensure	=> running,
		require	=> File["/etc/sysconfig/network-scripts/ifcfg-${nome_interface}"],
		enable	=> true,
}

}
}

