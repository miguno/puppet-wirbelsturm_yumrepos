class wirbelsturm_yumrepos::miguno {

 file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-miguno':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0444,
    source => "puppet:///modules/${module_name}/RPM-GPG-KEY-miguno",
  }

  yumrepo { 'miguno':
    descr    => "Michael G. Noll (@miguno)'s public yum repository for Wirbelsturm",
    baseurl  => 'https://s3.amazonaws.com/yum.miguno.com/bigdata/redhat/6/x86_64/',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-miguno',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-miguno'],
    priority => 20,
  }

}
