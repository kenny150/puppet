# CRIAr USUÁRIOS

define ssh::newuser ( $comment ) {
include ssh

$usuario = $name
user	{ "$usuario":
	ensure		=> present,
	comment		=> "$comment",
	managehome	=> true,
	home		=> "/home/$usuario",
	}
file	{ "/home/$usuario":
	ensure		=> directory,
	}
}

