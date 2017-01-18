node 'puppet-client' { 
	include nginx
	include ssh
	include sudoers
	file    { '/tmp/hello': content	=> "Hello, world\nThis is my nodes.pp file\n", }
	user 	{ 'kalves': ensure => present, comment => "Kennedy Alves", home => '/home/kalves', managehome => true, }
	ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1", }
	exec	{ 'Executando comando': command => 'echo Executei este comando', path => '/usr/bin:/usr/sbin:/bin'; }
}
node 'puppet-client2' { 
	include nginx
	include ssh
	include sudoers
        user    { 'kalves': ensure => present, comment => "Kennedy Alves", home => '/home/kalves', managehome => true, }
        ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1", }
	exec	{ 'Executando comando': command => 'echo "Executei este comando " > /tmp/output.txt', path => '/usr/bin:/usr/sbin:/bin'; }
        #ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "", }
        #Para remover o acesso temporariamente do usuário

}
