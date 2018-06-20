class brito-postfix {


package { 'postfix':
#	alias 	      => 'postfix',
	ensure 	      => installed,
	allow_virtual => true,
}

file { 'main.cf':
	path => '/etc/postfix/main.cf',
	ensure => present,
	owner => root,
	group => root,
	mode => 0644,
	content => template('brito-postfix/main.cf.erb'),
	#source => 'puppet:///modules/brito-postfix/main.cf',
	require => Package ['postfix'],
#	notify => Service ['postfix'],
}

file { 'transport':
	path => '/etc/postfix/transport',
	ensure => present,
	owner => root,
	group => root,
	mode => 0644,
	source => 'puppet:///modules/brito-postfix/transport',
	require => Package ['postfix'],
#	notify => Service ['postfix'],
}

file { 'maildrop':
	path => '/var/spool/postfix/maildrop',
#	ensure => present,
 	ensure => directory,
	owner => postfix,
	group => postdrop,
	mode => 0770,
	require => Package ['postfix'],
#	notify => Service ['postfix'],
}

file { 'sendmail':
	path => '/usr/sbin/sendmail.postfix',
	ensure => present,
# 	ensure => directory,
	owner => root,
	group => postdrop,
	mode => 0750,
	require => Package ['postfix'],
	notify => Service ['postfix'],
}

exec { "postfix-postmap-generic":
    refreshonly => true,
    command     => "/usr/sbin/postmap /etc/postfix/transport"
  }

service { 'postfix':
#	alias => 'servico',
	ensure => running,
	enable => true,
	hasrestart => true,
	hasstatus => true,
}

}
