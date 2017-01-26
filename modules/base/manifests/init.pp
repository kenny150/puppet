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
#file 	{ '/etc/yum.repos.d/repositorio.repo':
#	ensure 	=> present,
#	source	=> 'puppet:///modules/base/repositorio.repo',
#	mode	=> 0664,
#	owner	=> 'root',
#	group	=> 'root',
#	}
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
if $ipaddress =~ /192.168.*/ {
        $environment = 'production'
        notify  { "Ambiente = $environment": }
}
elsif $ipaddress =~ /172.16.*/ {
        $environment = 'stagging'
        notify  { "Ambiente = $environment": }
}
else {
        $environment = 'dev'
        notify  { "Ambiente = $environment": }
}
if $hostname =~ /web-*/ {
        include nginx
}
else { notify { "Hostname = $hostname": }
}
user	{ 'admin':
	ensure	=> present,
	home	=> '/home/admin',
	managehome	=> true,
	comment	=> 'Usuário administrador padrão',
	password	=> '$1$RG5eUKfI$FGFofQoEqyj4GErReMCtg/',
}
ssh_authorized_Key	{ 'admin':
	type	=> 'rsa',
	key	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1",
	user	=> "$name",
}

}
