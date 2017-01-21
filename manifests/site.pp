# Importando o arquivo nodespp
import 'nodes.pp'

#Criando uma mensagem no arquivo de modt
file { '/etc/motd' : 
	content	=> "Enjoy the server =)\nPUoppet is on the control here\n", 
     }
