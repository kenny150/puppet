import 'nodes.pp'
#Criando um hello word dentro de /tmp/
#file { '/tmp/hello': content	=> "Hello, World\n",}
#Criando uma mensagem no arquivo de modt
file { '/etc/motd' : content	=> "Enjoy the server =)\nPUoppet is on the control here\n", }
