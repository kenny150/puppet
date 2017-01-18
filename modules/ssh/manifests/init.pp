class ssh {
	service  {'sshd': ensure => running, }
        file { '/etc/ssh/sshd_config': source => 'puppet:///modules/ssh/sshd_config_puppet', notify => Service['sshd'], owner => 'root', group => 'root',  }
#        exec { 'restart-ssh': path => '/usr/bin:/usr/sbin:/bin', command => 'systemctl restart sshd', }

}

