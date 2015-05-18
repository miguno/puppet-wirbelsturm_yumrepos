class wirbelsturm_yumrepos::confluent {

 file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-confluent':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0444,
    source => "puppet:///modules/${module_name}/RPM-GPG-KEY-confluent",
  }

  yumrepo { 'confluent':
    descr    => 'Confluent repository for 1.x packages',
    baseurl  => 'http://packages.confluent.io/rpm/1.0',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-confluent',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-confluent'],
    priority => 20,
  }

}
