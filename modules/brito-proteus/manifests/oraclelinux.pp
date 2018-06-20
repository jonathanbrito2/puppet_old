class brito-proteus::oraclelinux {

$package_erase = [ 'rtkit','ModemManager','libvirt*','cups','avahi','abrt*' ]
$service_mask = [ 'ksm.service','ksmtuned.service','bab_RHEL' ]


package { $package_erase : ensure => purged }

service { $service_mask  : ensure => stopped, enable => false }

# Config arquivos do sistema - PROTEUS PLANILHA 102016 
#
	
	case $operatingsystem {
    OracleLinux: {


	schedule { "daily":
	period => daily,
	range => "21 - 23",
	repeat => "1",
  }  

 exec { 'yum-clean-expire-cache':
          user => 'root',
          path => '/usr/bin',
          command => 'yum clean all',
        }

  exec { "update_so":
  	  user => "root",
  	  command => 'yum --exclude=mysql* --exclude=php* update kernel -y',
          path => '/usr/bin',
  	  schedule => daily,
  	  refreshonly => true,
  }


        Package { require => Exec['yum-clean-expire-cache','update_so'] }



	file {
           'perm_log.sh':
            ensure => 'file',
            source => "puppet:///modules/brito-proteus/perm_log.sh",
            owner => 'root',
            group => 'root',
            mode  => '0755', # Use 0700 if it is sensitive
            path  => '/usr/local/bin/perm_log.sh',
            notify => Exec['change_perm_log'],
        }
 
                    exec { 'change_perm_log':
                    command => "/bin/bash -c '/usr/local/bin/perm_log.sh'",
                    onlyif => '/usr/bin/test -e /usr/local/bin/perm_log.sh',
                         }

   exec { "check_file":
 
         command => '/bin/true',
         onlyif => '/usr/bin/test -e /etc/php.ini',
 }
 
         file { 'php.ini':
              ensure  => 'present',
              path    => '/etc/php.ini',
              owner   => 'root',
              group   => 'root',
              mode    => '0644',
              source  => "puppet:///modules/brito-proteus/php.ini",
              require => Exec["check_file"],
        }


	
	file_line { 'sysconfig/init':
	  ensure => present,
  	  line => 'PROMPT=no',
	  path => '/etc/sysconfig/init'
	}
	
	file_line { '/etc/security/limits.conf':
	  ensure => present,
	  line => '* hard core 0',
	  path => '/etc/security/limits.conf'
	}

	file_line { '/etc/sysctl.conf':
	  ensure => present,
	  line => 'fs.suid_dumpable=0',
	  path => '/etc/sysctl.conf'
	}
	
	file_line { '/etc/sysctl.conf2':
	  ensure => present,
	  line => 'kernel.randomize_va_space=1',
	  path => '/etc/sysctl.conf'
	}
	
	file_line { '/etc/sysctl.conf3':
	  ensure => present,
	  line => 'net.ipv4.conf.all.send_redirects=0',
	  path => '/etc/sysctl.conf'
	}
	
	file_line { '/etc/sysctl.conf4':
	  ensure => present,
	  line => 'net.ipv6.conf.all.accept_ra=0',
	  path => '/etc/sysctl.conf'
	}

	file_line { '/etc/sysctl.conf5':
	  ensure => present,
	  line => 'kernel.randomize_va_space=1',
	  path => '/etc/sysctl.conf'
	}


   }
  
}
# Crontab para rodar automaticamente o script perm_log.sh

        cron { 'cron_perm_log':
            ensure  => 'present',
            command => '/usr/local/bin/perm_log.sh',
            user => 'root',
            hour => [ 23, 5 ],
            minute => '30',
}



}
