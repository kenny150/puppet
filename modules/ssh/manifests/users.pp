# INCLUINDO USUÁRIOS QUE PODEM FAZER SSH

define ssh::users ( $key ){
include ssh 
$usuario = $name
$chave = $key
ssh_authorized_key	{ "$usuario":
			user	=> "$usuario",
			type	=> 'rsa',
			key	=> "$chave",
			}		
}
