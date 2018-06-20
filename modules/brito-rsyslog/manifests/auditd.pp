class brito-rsyslog::auditd {

package {'audit':
	ensure => installed,
	allow_virtual => true,
}

file { 'audit.rules':
	path 	=> '/etc/audit/rules.d/audit.rules',
	ensure 	=> 'present',
	owner => root,
        group => root,
        mode => 0644,
	source	=> 'puppet:///modules/brito-rsyslog/audit.rules',
	require	=> Package ['audit'],
	notify 	=> Service ['auditd'],
}

file { 'syslog.conf':
	path 	=> '/etc/audisp/plugins.d/syslog.conf',
	ensure 	=> 'present',
	owner => root,
        group => root,
        mode => 0644,
	source	=> 'puppet:///modules/brito-rsyslog/syslog.conf',
	require	=> Package ['audit'],
	notify 	=> Service ['auditd'],
}

service { 'auditd':
          ensure => running,
          enable => true,
          hasrestart => true,
          hasstatus => true,
}


}
