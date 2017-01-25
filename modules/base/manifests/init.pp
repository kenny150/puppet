# PREPARANDO SISTEMA OPERACIONAL

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
	mode 	=> 0664,
	owner	=> 'root',
	group	=> 'root',
	}
file 	{ '/etc/yum.repos.d/repositorio.repo':
	ensure 	=> present,
	source	=> 'puppet:///modules/base/repositorio.repo',
	mode	=> 0664,
	owner	=> 'root',
	group	=> 'root',
	}
file	{ '/etc/nsswitch.conf':
	ensure	=> present,
	source	=> 'puppet:///modules/base/nsswitch.conf',
	mode	=> 0664,
	owner	=> 'root',
	group	=> 'root',	
	}
file	{ '/var/git/puppet/.git/config':
	ensure	=> present,
	source	=> 'puppet:///modules/base/git.config',
	mode	=> 0664,	
	owner	=> 'git',
	group	=> 'git',
	}	
} 
default:  { notify{ 'Sistema operacional é Debian': }
	}
	}
}
