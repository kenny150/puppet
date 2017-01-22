# INSTALANDO O FIREWALLD PARA DISTRIBUIÇÕES REDHAT

define base::firewalld () {

include base

package	{ 'firewalld':
	ensure	=> present,
	}

service	{ 'firewalld':
	ensure	=> running,
	require	=> Package['firewalld'],
	}
}
