class ocsinventory::remi {
#class remi {
   yumrepo { "remi":
      mirrorlist => "http://rpms.remirepo.net/enterprise/7/remi/mirror",
#baseurl => "http://dl.iuscommunity.org/pub/ius/stable/$operatingsystem/$operatingsystemrelease/$architecture",
      descr => "REMI Community repository",
      enabled => 1,
      gpgcheck => 0,
#      gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi"	
   }
}
