class wirbelsturm_yumrepos::nginx {

 file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-nginx':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0444,
    source => "puppet:///modules/${module_name}/RPM-GPG-KEY-nginx",
  }

  yumrepo { 'nginx':
    descr    => 'Official Red Hat packages for nginx (from nginx.org)',
    baseurl  => 'http://nginx.org/packages/rhel/6/$basearch/',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nginx',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-nginx'],
  }

}
