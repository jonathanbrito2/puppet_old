# https://forge.puppet.com/jgazeley/winbind
# Install samba and winbind, and join box to the domain
class winbind::matriz (
  $domainadminuser 	= 'jonathan.abrito.adm',
  $domainadminpw	= 'p1m3nt@2109',
  $realm		= 'si-caju.abnote.com.br',
  $domain		= 'SI-CAJU',
  $server		= 'VMAPOLO',
  $createcomputer       = $hostname,
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
    'samba',
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
#    command => "net ads join -U ${domainadminuser}%${domainadminpw}",
#    command => "/usr/bin/net join -w ${domain} -S ${server} -U ${domainadminuser}%${domainadminpw}",
    
    command => "rm -rf /var/lib/samba/winbindd_cache.tdb && /usr/bin/net join -w ${domain} -U ${domainadminuser}%${domainadminpw}",
    onlyif  => "wbinfo --own-domain | grep -v ${domain}",
    path    => '/bin:/usr/bin',
    notify  => Service['winbind'],
    require => [ File['smb.conf'], Package['samba-winbind-clients'] ],
  }

file { 'system-auth':
         ensure => 'present',
         path   => '/etc/pam.d/system-auth',
         owner  => 'root',
         group  => 'root',
         mode   => '0644',
         source => "puppet:///modules/winbind/system-auth",
     }

file { 'su':
         ensure => 'present',
         path   => '/etc/pam.d/su',
         owner  => 'root',
         group  => 'root',
         mode   => '0644',
         source => "puppet:///modules/winbind/su",
     }
file { 'system-auth-ac':
         ensure => 'present',
         path   => '/etc/pam.d/system-auth-ac',
         owner  => 'root',
         group  => 'root',
         mode   => '0644',
         source => "puppet:///modules/winbind/system-auth-ac",
     }


file { 'password-auth':
         ensure => 'present',
         path   => '/etc/pam.d/password-auth',
         owner  => 'root',
         group  => 'root',
         mode   => '0644',
         source => "puppet:///modules/winbind/password-auth",
     }

file { 'password-auth-ac':
         ensure => 'present',
         path   => '/etc/pam.d/password-auth-ac',
         owner  => 'root',
         group  => 'root',
         mode   => '0644',
         source => "puppet:///modules/winbind/password-auth-ac",
     }

file { 'nsswitch.conf':
         ensure => 'present',
         path   => '/etc/nsswitch.conf',
         owner  => 'root',
         group  => 'root',
         mode   => '0644',
         source => "puppet:///modules/winbind/nsswitch.conf",
     }


file { 'krb5.conf':
         ensure => 'present',
         path   => '/etc/krb5.conf',
         owner  => 'root',
         group  => 'root',
         mode   => '0644',
         source => "puppet:///modules/winbind/krb5.conf",
     }

file { 'pam_winbind.conf':
         ensure => 'present',
         path   => '/etc/security/pam_winbind.conf',
         owner  => 'root',
         group  => 'root',
         mode   => '0644',
         source => "puppet:///modules/winbind/pam_winbind.conf",
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
