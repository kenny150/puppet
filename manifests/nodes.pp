node 'puppet-client' { 
	file    { '/tmp/hello': content	=> "Hello, world\nThis is my nodes.pp file\n", }
	#package { 'nginx':      ensure	=> installed, }
	include nginx
}
