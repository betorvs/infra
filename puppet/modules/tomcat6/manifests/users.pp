class tomcat6::users {
	
  # grupo/usuario do componente
  group {'tomcat':
    ensure => present,
    gid    => '2000';
  }
  user {'tomcat':
    ensure     => present,
    uid        => '2000',
    gid        => '2000',
    shell      => '/bin/bash',
    home       => '/opt/tomcat6',
    managehome => true,
    password   => '!!',
    require    => [ Group['tomcat'] ];
  }

}
