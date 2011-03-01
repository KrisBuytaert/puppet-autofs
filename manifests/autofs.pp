class autofs  {

  package {
    "autofs":
      ensure => "installed";
  }

  service {
    "autofs":
      enable    => true,
      ensure    => running,
      hasstatus => true, 
      require   => Package['autofs'];
  }

}

class autofs::master($mountpoints,
                     $maps,
                     $options=[]) {

  include autofs

  file {
    "/etc/auto.master":
      owner   => "root",
      group   => "root",
      mode    => 0644,
      content => template("autofs/auto.master.erb"),
      require => Package["autofs"],
      notify  => Service["autofs"];
  }

}

define autofs::mnt ($keys,
                    $options,
                    $locations) {

  include autofs

  file {
    "/etc/auto.$name":
      owner   => "root",
      group   => "root",
      mode    => "0644",
      require => Package['autofs'],
      notify  => Service['autofs'],
      content => template("autofs/auto.mnt.erb");
  }

}

define autofs::multimnt ($keys,
                         $mountpoints,
                         $options,
                         $locations) {

  include autofs

  file {
    "/etc/auto.$name":
      owner   => "root",
      group   => "root",
      mode    => "0644",
      require => Package['autofs'],
      notify  => Service['autofs'],
      content => template("autofs/auto.multimnt.erb");
  }


}
