# PEGANDO SISTEMA OPERACIONAL

class base {
	case $::osfamily {
	'RedHat': {
		notify 	{ "Iniciando ...": }
		package { 'firewalld':
			ensure	=> present,
			}
		service	{ 'firewalld':
			ensure	=> running,
			enable	=> true,
			require	=> Package['firewalld'],
			}
		notify	{ 'Quase lá ...': }	
		package	{ 'iptables-services':
			ensure	=> absent,
			}
		  } 
    	 default:  { notify{ 'Sistema operacional é Debian':}
}
}
}
