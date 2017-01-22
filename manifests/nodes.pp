# Receitas para o node puppet-client
node 'puppet-client' { 

# Declarando a definição website que fica dentro do modulo do nginx, passando o valor da variável site_domain que será recebida dentro de website.pp 
# A variavel site_domain já está declarada em website.pp, por isso ela vem se cifrão
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
# Definindo o valor das variaveis
	$site_name = 'cat-pictures'
	$site_domain = 'cat-pictures.com'
	$ntp_server = '192.168.0.100'
# Incluindo as classes nginx, ssh, sudoers, ntp	
	include nginx
	include ssh
	include sudoers
	include ntp
	include base
# Criando um arquivo em /tmp/ com o conteúdlo hello, world ...
	file    { '/tmp/hello': 
		content	=> "Hello, world\nThis is my nodes.pp file\n", 
	}
# Criando um usuário chamado kalves, definido a home e permitindo que o puppet crie o diretório caso ele nao exista (managehome)
	user 	{ 'kalves': 
		ensure 		=> present, 
		comment 	=> "Kennedy Alves", 
		home 		=> '/home/kalves', 
		managehome 	=> true,
	}
# Dando acesso via chave para o usuário
	ssh_authorized_key { 'kalves': 
		user 	=> 'kalves',
		type 	=> 'rsa',
		key 	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1", 
	}
	#ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "", }
        #Para remover o acesso temporariamente do usuário
# Executando comando apenas para teste do resource type
	exec	{ 'Executando comando':
		command => 'echo Executei este comando', 
		path 	=> '/usr/bin:/usr/sbin:/bin',
	}
# Criando uma cron para fazer um backup do nginx sempre as 4 da manhã
        cron 	{ 'backup-nginx': 
		command => '/usr/bin/rsync -avz /etc/nginx/ /etc/nginx-backup/',
		hour 	=> '04',
		minute 	=> '00', 
	}
# Criando uma cron para fazer o sync com o repositório
	cron 	{ 'git-pull': 
		command => '/usr/local/bin/pull-updates',
		minute 	=> '*/10',
		hour	=> '*',
		user	=> 'git',
	}
# Criando o arquivo cat-pictures.conf baseado no template vhost.conf.erb
	file	{ '/etc/nginx/conf.d/cat-pictures.conf':
		content => template('nginx/vhost.conf.erb'),
		notify	=> Service['nginx'],
	}
# Criando arquivo de teste
	file 	{ '/tmp/teste':
		content => 'Testando',
	}
# Criando frase de boas vindas
	file { '/etc/motd' :
        	content => "Enjoy the server =)\nPUoppet is on the control here\n",
        }

} #Encerrando a declaração do node puppet-client2

##############################################################################################
# Receitas para o node puppet-client
node 'puppet-client2' { 
# Definindo valores de variaveis 	
	$site_name = 'dog-pictures'
	$site_domain = 'dog-pictures.com'
# Importando modulos
	include nginx
	include ssh
	include sudoers
# Criando um arquivo em /tmp/ com o conteúdlo hello, world ...
	file    { '/tmp/hello':
                content => "Hello, world\nThis is my nodes.pp file\n",
        }
# Criando usuário kalves        
	user    { 'kalves':
                ensure 		=> present,
                comment 	=> "Kennedy Alves",
                home 		=> '/home/kalves',
                managehome 	=> true,
        }
# Declarando chave de acesso
        ssh_authorized_key { 'kalves':
                user 	=> 'kalves',
                type 	=> 'rsa',
                key 	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1", 
        }
        #ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "", }
        #Para remover o acesso temporariamente do usuário
# Executando comando de teste
        exec    { 'Executando comando': 
                command => 'echo Executei este comando',  
                path 	=> '/usr/bin:/usr/sbin:/bin', 
        }
# Declarando um cron para fazer backup do nginx as 04 da manhã
        cron    { 'backup-nginx': 
                command => '/usr/bin/rsync -avz /etc/nginx/ /etc/nginx-backup/', 
                hour 	=> '04', 
                minute 	=> '00', 
	}
# Declarando um job para atualizar o repositório 
	cron 	{ 'git-pull': 
		command => '/usr/local/bin/pull-updates',
		minute 	=> '*/10',
		hour	=> '*',
		user	=> 'git',
	}
# Criando o arquivo dog-pictures baseado no template vhost.conf.erb
	file	{ '/etc/nginx/conf.d/dog-pictures.conf':
		content	=> template('nginx/vhost.conf.erb'),
		notify	=> Service['nginx'],
	}
	file { '/etc/motd' :
        	content => "Enjoy the server =)\nPUoppet is on the control here\n",
	}
}# Fim da reclaraçao dos recursos de puppet-client2
