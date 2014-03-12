class wirbelsturm_yumrepos::epel {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-wirbelsturm-epel-6':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0444,
    source => "puppet:///modules/${module_name}/RPM-GPG-KEY-wirbelsturm-epel-6",
  }

  yumrepo { 'wirbelsturm-epel-6':
    descr      => 'Extra Packages for Enterprise Linux (EPEL) 6 -- added by Wirbelsturm',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-wirbelsturm-epel-6',
    require    => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-wirbelsturm-epel-6'],
    # Never use ZeroMQ from EPEL -- we want yum & Co. to get ZeroMQ from our custom repository
    exclude    => 'zeromq*',
  }

}
