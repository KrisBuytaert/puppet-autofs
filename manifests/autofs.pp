class autofs  {

	package {
		"autofs":
			ensure => "installed";
	}



	service {
		"autofs":
			enable  => "true",
			ensure  => $ensure_service,
			hasstatus => true, 
			require => Package['autofs'];
	}

}

define autofs::maps($mountpoints,
              $maps,
              $options=[]) 
{
   file {
     "$mountpoints":
			ensure => "directory";
    "/etc/auto.master":
      owner   => "root",
      group   => "root",
      mode    => 0644,
      content => template("autofs/auto.master.erb"),
      notify  => Service["autofs"];
  }


  


#		"/etc/auto.master":
#			owner   => "root",
#                        group   => "root",
#                       mode    => "0644",
#                       require => Package['autofs'],
#                        notify  => Service['autofs'],
#                        content => "/mnt	/etc/auto.mnt";

}





define autofs::mnt ($directory, $password, $mount) {

	include autofs

	file {
		"/etc/auto.$name":
			owner   => "root",
			group   => "root",
			mode    => "0644",
			require => Package['autofs'],
			notify  => Service['autofs'],
			content => template("headers/header-hash.erb","autofs/auto.mnt.erb");
	}
}
