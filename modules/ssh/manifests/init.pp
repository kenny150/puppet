class ssh {

package	{ 'openssh':
	ensure	=> installed,
	}
service {'sshd': 
	ensure 	=> running, 
	require	=> [Package['openssh'],File['/etc/ssh/sshd_config']],
	}
file 	{ '/etc/ssh/sshd_config': 
	source => 'puppet:///modules/ssh/sshd_config_puppet',
	notify => Service['sshd'], 
	owner => 'root', 
	group => 'root',  
	}
file	{ '/etc/ssh':
	ensure	=> directory,
	}
}

