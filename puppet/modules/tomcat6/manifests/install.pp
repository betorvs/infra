class tomcat6::install {

	archive { 'apache-tomcat-6.0.37.tar.gz'
		ensure => present,
		url    => 'http://ftp.unicamp.br/pub/apache/tomcat/tomcat-6/v6.0.37/bin/apache-tomcat-6.0.37.tar.gz',
		target => '/opt',
	}

	# preferred symlink syntax
	file { '/opt/tomcat6':
	   ensure    => 'link',
	   target => '/opt/apache-tomcat-6.0.37',
	}
}
