class wirbelsturm_yumrepos::puppetlabs {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0444,
    source => "puppet:///modules/${module_name}/RPM-GPG-KEY-puppetlabs",
  }

  # TODO: On AWS a 'priority' setting on the amzn-updates repo prevents the installation of Puppet 3.x from
  #       this repo.  Adding a priority <= 10 fixes this on AWS but this hack may not be portable beyond AWS.
  yumrepo { 'puppetlabs-products':
    descr    => 'Puppet Labs Products El 6 - $basearch',
    baseurl  => 'http://yum.puppetlabs.com/el/6/products/$basearch',
    enabled  => 1,
    priority => 10,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'],
  }

  yumrepo { 'puppetlabs-deps':
    descr    => 'Puppet Labs Dependencies El 6 - $basearch',
    baseurl  => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'],
  }

  yumrepo { 'puppetlabs-devel':
    descr    => 'Puppet Labs Devel El 6 - $basearch',
    baseurl  => 'http://yum.puppetlabs.com/el/6/devel/$basearch',
    enabled  => 0,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'],
  }

}
