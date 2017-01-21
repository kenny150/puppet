# Gerenciamento NTP
class ntp ( $ntp_server='192.168.0.102') {
package { 'ntp':
	ensure => installed, 
}
file 	{ '/etc/ntp.conf':
	content => template('ntp/ntp.conf.erb'),
	notify	=> Service['ntpd'],
}
service { 'ntpd':
	ensure	=> running,
	enable	=> true,
	#require	=> [ Package[ntp], File['/etc/ntp.conf'] ],
	require	=> Package['ntp'],
}
}
