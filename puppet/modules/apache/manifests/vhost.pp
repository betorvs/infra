class apache::vhost {

  define vhostsfiles{
	  file { $title:
		  mode   => '0644',
		  source => "files/${title}",
	  }
  vhostsfiles{
	  [
		'/etc/httpd/conf.d/00-admin.zolkin.com.br.conf', '/etc/httpd/conf.d/00-apimobile.zolkin.com.br.conf', '/etc/httpd/conf.d/00-zolkin.com.br.conf'
	  ]:
  }


}
