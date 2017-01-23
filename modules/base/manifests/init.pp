# PEGANDO SISTEMA OPERACIONAL

class base {
	case $::osfamily {
	'RedHat': {
		include ntp 
		package { 'firewalld':
			ensure	=> present,
			}
		service	{ 'firewalld':
			ensure	=> running,
			enable	=> true,
			require	=> Package['firewalld'],
			}
		package	{ 'iptables-services':
			ensure	=> absent,
			}
		  } 
    	 default:  { notify{ 'Sistema operacional é Debian': }
}
}
}
