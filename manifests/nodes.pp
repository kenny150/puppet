node 'puppet-client' { 
	include nginx
	file    { '/tmp/hello': content	=> "Hello, world\nThis is my nodes.pp file\n", }
	#package { 'nginx':      ensure	=> installed, }
	user 	{ 'art': ensure => present, comment => "Art Vanderley", home => '/home/art', managehome => true, }
}
node 'puppet-client2' { 
	include nginx

}
