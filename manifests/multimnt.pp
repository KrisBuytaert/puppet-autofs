
define autofs::multimnt ( $keys,
                          $mountpoints,
                          $options,
                          $locations) {

  include autofs

  file {
    "/etc/auto.${name}":
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package['autofs'],
      notify  => Service['autofs'],
      content => template('autofs/auto.multimnt.erb');
  }

}
