class sudoers {
	file { '/etc/sudoers': source => 'puppet:///modules/sudoers/sudoers_puppet', mode => 0440, owner=> 'root', group=> 'root', }
}
