class wirbelsturm_yumrepos::cloudera_cdh4 {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0444,
    source => "puppet:///modules/${module_name}/RPM-GPG-KEY-cloudera",
  }

  yumrepo { 'cloudera-cdh4':
    baseurl  => 'http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/4/',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera'],
  }

}
