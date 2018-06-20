class brito-repo {

file { '/puppet':
	ensure => directory,
	mode => 0777,
}

mount { '/puppet':
	alias => 'p',
	device => "puppetmaster:/puppet",
	fstype => 'nfs',
	ensure => 'mounted',
	options => 'defaults,nosuid',
	atboot => true,
	require => File ['/puppet'],
}
# Define a versao do S.O
case $operatingsystem {
     CentOS: {

if $operatingsystemmajrelease == '6' { 
  $conf = 'local6.repo'
 } 
elsif $operatingsystemmajrelease == '7' {
  $conf = 'local7.repo' 
}

else {
  fail("SO nao reconhecido")
}

}
}

file { "$conf": 
  ensure  => 'present', 
  path => '/etc/yum.repos.d/local.repo', 
  owner => root,
  group => root,
  mode => 0644,
  source => "puppet:///modules/brito-repo/${conf}",	
  require => Mount ['p'],
 }

## Comentei por que já tenho tudo cadastrado no DNS.
file { hosts:
  ensure => 'present',
  path => '/etc/resolv.conf',
  owner => root,
  group => root,
  mode => 0644,
  source => "puppet:///modules/brito-repo/resolv",
}

## Nao sera preciso criar um repositorio para o puppet em separada
#file { 'puppet.repo':
#  ensure => 'present',
#  path => '/etc/yum.repos.d/puppet.repo',
#  owner => root,
#  group => root,
#  mode => 0644,
#  source => "puppet:///modules/brito-repo/puppet.repo",
#}


}
