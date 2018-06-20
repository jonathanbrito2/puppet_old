class dexter-ssh {

$service_name = $operatingsystem ? { 
  Debian => 'ssh', 
  Ubuntu => 'ssh', 
  CentOS => 'sshd', 
  RedHat => 'sshd', 
  OracleLinux => 'sshd', 
  OpenSuSE => 'sshd', 
  Solaris => 'ssh',
 } 

$conf_file = $operatingsystem ? { 
  Debian => 'sshd_config.debian.erb', 
  Ubuntu => 'sshd_config.ubuntu.erb', 
  CentOS => 'sshd_config.centos.erb', 
  RedHat => 'sshd_config.centos.erb', 
  OracleLinux => 'sshd_config.centos.erb', 
  OpenSuSE => 'sshd_config.opensuse.erb', 
  Solaris => 'sshd_config.solaris.erb',
 } 

$package_name = $operatingsystem ? { 
  Debian => 'ssh', 
  Ubuntu => 'openssh-server', 
  CentOS => 'openssh-server', 
  RedHat => 'openssh-server', 
  OracleLinux => 'openssh-server', 
  OpenSuSE => 'openssh', 
  Solaris => 'ssh',
 } 

package { $package_name:
   ensure  => 'present',
 }

service { "$service_name": 
  ensure => 'running', 
  enable => true, 
  hasrestart => true, 
  hasstatus => true, 
  require => Package[$package_name], 
 } 

file { 'sshd_config': 
  ensure  => 'present', 
  path => '/etc/ssh/sshd_config', 
  content => template("dexter-ssh/$conf_file"),
  #source => "puppet:///modules/dexter-ssh/$conf_file", 
  notify => Service[$service_name], 
  require => Package[$package_name], 
 }
}
