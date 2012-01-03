
class autofs::master ($mountpoints,
                      $maps,
                      $options=[]) {


  file {
    '/etc/auto.master':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('autofs/auto.master.erb'),
      require => Package['autofs'],
      notify  => Service['autofs'];
  }

}

