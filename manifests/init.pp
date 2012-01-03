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

}
