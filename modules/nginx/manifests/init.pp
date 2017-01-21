# Classe para instalação do nginx
# Nome da classe
class nginx { 
# Remove o pacote httpd
	package { 'httpd': 
		ensure => absent,
	}
# Instala o pacote do nginx
	package { 'nginx': 
		ensure => installed,
		require => Package['httpd'],
	}
# Diz que o servico deve estar rodando e iniciando automaticamente junto com o sistema
	service { 'nginx': 
		ensure => running, 
		require => Package['nginx'], 
		enable => true,
	}
# Remove o arquivo ../default.d/default
	file 	{ '/etc/nginx/default.d/default': 
		ensure => absent, 
	}
}
