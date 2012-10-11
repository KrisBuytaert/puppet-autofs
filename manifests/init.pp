class autofs  {

  package {
    'autofs':
      ensure => 'installed';
  }

  service {
    'autofs':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      require   => Package['autofs'];
  }

  file {
    '/etc/sysconfig/autofs':
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => 'puppet:///modules/autofs/autofs',
      notify => Service['autofs'];
  }

}
