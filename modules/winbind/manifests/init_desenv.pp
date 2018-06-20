# https://forge.puppet.com/jgazeley/winbind
# Install samba and winbind, and join box to the domain
# MODIFICADO POR JONATHAN BRITO - 27-09-2016

class winbind (
# DEFINE DOMAIN, USERS AND PW
  $domain_name = $domain         ? {
	si-caju.abnote.com.br	=> 'SI-CAJU',
	cnhgo.local		=> 'CNHGO', 
	cnhsp.local		=> 'CNHSP', 
	cnhrs.local		=> 'CNHRS', 
}
  $var_domainadminuser = $domain ? {
  	si-caju.abnote.com.br	=> 'jonathan.abrito',
	cnhgo.local		=> 'prometeu',
	cnhsp.local		=> 'prometeu',
	cnhrs.local		=> 'prometeu',
}
 $var_domainadminpw = $domain    ? {
  	si-caju.abnote.com.br	=> 'p1m3nt@2109',
	cnhgo.local		=> '@V5791alto',
	cnhsp.local		=> 'V5791alto',
	cnhrs.local		=> 'V5791alto',
}
  	$domain			= $domain_name,
  	$realm			= $domain,
	$domainadminuser 	= $var_domainadminuser,
	$domainadminpw		= $var_domainadminpw,
	#$createcomputer       = 'Computers' ,
  	$machine_password_timeout = 604800,
  	$netbiosname = $::netbiosname,
  	$nagioschecks = false,
  	$winbind_max_domain_connections = 1,
  	$winbind_max_clients = 200,
  	$osdata = false,
) {





  # Main samba config file
  file { 'smb.conf':
    name    => '/etc/samba/smb.conf',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('winbind/smb.conf.erb'),
    require => Package['samba-client'],
    notify  => [ Exec['add-to-domain'], Service['winbind'] ],
  }

  # Install samba winbind client
  package { [
    'samba-winbind-clients',
    'samba-winbind',
    'samba-client',
  ]:
    ensure  => installed,
  }

  # If createcomputer is defined, prepend it with the argument
  if ($createcomputer) {
    $createcomputerarg = "createcomputer=${createcomputer}"
  }

  # If $osdata=true, populate the string
  if ($osdata) {
    $osdataarg = "osName='${::operatingsystem}' osVer=${::operatingsystemmajrelease}"
  }

  # Add the machine to the domain
  exec { 'add-to-domain':
#    command => "net ads join -U ${domainadminuser}%${domainadminpw} ${createcomputerarg} ${osdataarg}",
    command => "net ads join -U ${domainadminuser}%${domainadminpw}",
    onlyif  => "wbinfo --own-domain | grep -v ${domain}",
    path    => '/bin:/usr/bin',
    notify  => Service['winbind'],
    require => [ File['smb.conf'], Package['samba-winbind-clients'] ],
  }

  # Start the winbind service
  service { 'winbind':
    ensure     => running,
    require    => [ File['smb.conf'], Package['samba-winbind'] ],
    subscribe  => File['smb.conf'],
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  if $nagioschecks == true {
    # Nagios plugin to check for domain membership
    @@nagios_service { "check_ads_${::fqdn}":
      check_command       => 'check_nrpe!check_ads',
      service_description => 'Domain',
      use                 => 'hourly-service',
    }
    @@nagios_servicedependency { "check_ads_${::fqdn}":
      dependent_host_name           => $::fqdn,
      dependent_service_description => 'Domain',
      service_description           => 'NRPE',
    }
  }
}
