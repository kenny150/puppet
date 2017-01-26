# DEFININDO CONFIGURAÇÃO QUE CADA NODE DEVE RECEBER

node 'puppet-client' { 

include base
base::rede { 'unset':
	nome_interface => 'enp0s8',
}	

include nginx

$site_name = 'cat-pictures'
$site_domain = 'cat-pictures.com'
$ntp_server = '192.168.0.100'

nginx::website { 'adorable-animals':
	site_domain => 'adorable-animals.com',
}
nginx::website { 'adorable-animals-staging':
	site_domain => 'staging.adorable-animals.com',
}
nginx::website { 'amazing-animals':
	site_domain => 'amazing-animals.com',
}
nginx::website { 'amazing2-animals':
	site_domain => 'amazing2-animals.com',
}
file    { '/etc/nginx/conf.d/cat-pictures.conf':
        content => template('nginx/vhost.conf.erb'),
        notify  => Service['nginx'],
}

ssh::newuser	{ 'kalves': 
	comment 	=> "Kennedy Alves", 
}
ssh::newuser	{ 'testando':
	comment		=> "Usuario teste puppet",
}	

ssh::users { 'kalves':
                key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1",
        }
ssh::users { 'git':
                key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1",
}
exec	{ 'Executando comando':
	command => 'echo Executei este comando', 
	path 	=> '/usr/bin:/usr/sbin:/bin',
}
cron 	{ 'backup-nginx': 
	command => '/usr/bin/rsync -avz /etc/nginx/ /etc/nginx-backup/',
	hour 	=> '04',
	minute 	=> '00', 
}
cron 	{ 'git-pull': 
	command => '/usr/local/bin/pull-updates',
	minute 	=> '*/10',
	hour	=> '*',
	user	=> 'git',
}
file { '/etc/motd' :
       	content => "Enjoy the server =)\nPUoppet is on the control here\n",
}

}


##############################################################################################

node 'web-dog' {

include base

}
