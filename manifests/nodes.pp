node 'puppet-client' { 
	include nginx
	file    { '/tmp/hello': content	=> "Hello, world\nThis is my nodes.pp file\n", }
	user 	{ 'kalves': ensure => present, comment => "Kennedy Alves", home => '/home/kalves', managehome => true, }
	ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1", }
}
node 'puppet-client2' { 
	include nginx
        user    { 'kalves': ensure => present, comment => "Kennedy Alves", home => '/home/kalves', managehome => true, }
        ssh_authorized_key { 'kalves': user => 'kalves', type => 'rsa', key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCpwAhX/pnIc3V66wU/nOlCwwI2iuB5E/+JE8+t11daeUOXEWTcS1/XStpXYCbJmALS+xg1TznRsUf1VFSdjgdlfKBCXyyvY/eiwDHz24CmqNLmBlNL6BSYnqTj5iPcR8eOWt4NZgu9G4tfOScLez2CsdIEKvO60ZnkFjPOZ5Wm+WvXbP7z0FGqBY2rwVxc7T0EYloafeZR6/aAeUkvA6DHrgIRyAKBp3cyT+M6nCU5whtWt1B062PtDdpX/VCTxdPqNCZaD1uVmG55yA1SC8B4iLABTv2V6RXkhRpnZUekfMs+i1SLl/st4rUOAP2BVTFFeyApzVqadmlTkvZtHsy1", }


}
