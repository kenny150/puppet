# PEGANDO SISTEMA OPERACIONAL

class base {

case $::osfamily {
'RedHat': {
include ntp
include ssh
include sudoers
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
file 	{ '/etc/hosts':
	ensure	=> present,
	content	=> template('base/hosts.conf.erb'),
	mode	=> 0664,
	owner	=> 'root',
	group	=> 'root',
	}
file 	{ '/etc/resolv.conf':
	ensure	=> present,
	source	=> 'puppet:///modules/base/resolv.conf',
	mode 	=> 0644,
	owner	=> 'root',
	group	=> 'root',
	}
} 
default:  { notify{ 'Sistema operacional é Debian': }
	}
	}
}
