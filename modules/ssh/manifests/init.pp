class ssh {
	service  {'ssh': ensure => running, }
	file { '/etc/ssh/sshd_config': source => 'puppet:///modules/ssh/sshd_config_puppet', notify => Service['ssh'], owner => 'root', group => 'root',  }

}

