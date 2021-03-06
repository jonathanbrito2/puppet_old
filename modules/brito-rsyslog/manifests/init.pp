class brito-rsyslog {

package {'rsyslog':
	ensure => installed,
	allow_virtual => true,
}

file { 'rsyslog.conf':
	path 	=> '/etc/rsyslog.conf',
	ensure 	=> 'present',
	owner => root,
        group => root,
        mode => 0644,
	source	=> 'puppet:///modules/brito-rsyslog/rsyslog.conf',
	require	=> Package ['rsyslog'],
	notify 	=> Service ['rsyslog'],
}

service { 'rsyslog':
          ensure => running,
          enable => true,
          hasrestart => true,
          hasstatus => true,
}

include brito-rsyslog::auditd

}
