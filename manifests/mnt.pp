
define autofs::mnt ($keys,
                    $options,
                    $locations) {


  file {
    "/etc/auto.$name":
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package['autofs'],
      notify  => Service['autofs'],
      content => template('autofs/auto.mnt.erb');
  }

}

