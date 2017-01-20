node 'puppet-client' { 
	
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
	$site_name = 'cat-pictures'
	$site_domain = 'cat-pictures.com'
	include nginx
	include ssh
	include sudoers
	file    { '/tmp/hello': 
		content	=> "Hello, world\nThis is my nodes.pp file\n", 
	}
	user 	{ 'kalves': 
		ensure 		=> present, 
		comment 	=> "Kennedy Alves", 
		home 		=> '/home/kalves', 
		managehome 	=> true,
	}
	ssh_authorized_key { 'kalves': 
		user 	=> 'kalves',
		type 	=> 'rsa',
		key 	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1", 
	}
	#ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "", }
        #Para remover o acesso temporariamente do usuário
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
	file	{ '/etc/nginx/conf.d/cat-pictures.conf':
		content => template('nginx/vhost.conf.erb'),
		notify	=> Service['nginx'],
	}
}
node 'puppet-client2' { 
	
	$site_name = 'dog-pictures'
	$site_domain = 'dog-pictures.com'
	include nginx
	include ssh
	include sudoers
	file    { '/tmp/hello':
                content => "Hello, world\nThis is my nodes.pp file\n",
        }
        user    { 'kalves':
                ensure 		=> present,
                comment 	=> "Kennedy Alves",
                home 		=> '/home/kalves',
                managehome 	=> true,
        }
        ssh_authorized_key { 'kalves':
                user 	=> 'kalves',
                type 	=> 'rsa',
                key 	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1", 
        }
        #ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "", }
        #Para remover o acesso temporariamente do usuário
        exec    { 'Executando comando': 
                command => 'echo Executei este comando',  
                path 	=> '/usr/bin:/usr/sbin:/bin', 
        }
        cron    { 'backup-nginx': 
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
	file	{ '/etc/nginx/conf.d/dog-pictures.conf':
		content	=> template('nginx/vhost.conf.erb'),
		notify	=> Service['nginx'],
	}
}
