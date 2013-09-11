class base {
	package { wget:
		ensure => present,
	}
	package { vim-enhaced:
		ensure => present,
	}
}
