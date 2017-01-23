# CONFIGURA NTP 
class ntp {
package { 'ntp':
	ensure => present, 
}
file 	{ '/etc/ntp.conf':
	content => template('ntp/ntp.conf.erb'),
	notify	=> Service['ntpd'],
}
service { 'ntpd':
	ensure	=> running,
	enable	=> true,
	require	=> [ Package['ntp'], File['/etc/ntp.conf'] ],
}
}
