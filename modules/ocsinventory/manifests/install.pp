# == Class ocsinventory::install
#
class ocsinventory::install {
  if $::ocsinventory::agent {
    package { $::ocsinventory::pkg_list_agent:
      ensure => $::ocsinventory::pkg_agent_ensure,
      notify => Exec ['start_ocs']
    }

#   exec { "proxy-export-vars":
#    provider => "shell",
#    command => "export http_proxy=http://proxy:3128",
#}
   exec {'start_ocs':
      path        => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
      command     => "/usr/bin/perl /usr/sbin/ocsinventory-agent -d",
      unless      => "/usr/bin/perl /usr/sbin/ocsinventory-agent -f",
	   
}
}


  if $::ocsinventory::server {
    package { $::ocsinventory::pkg_list_server:
      ensure => $::ocsinventory::pkg_server_ensure,
    }
  }
}

