# == Class ocsinventory::params
#
class ocsinventory::params {

  case $::domain {
    'si-caju.abnote.com.br': {
  $agent             = true
  $agent_ocs_mode    = 'cron'
  $agent_ocs_pause   = 100
  $agent_ocs_server  = 'inventario'
  $agent_ocs_tag     = 'RJ-Matriz'  
  $pkg_agent_ensure  = present
  $pkg_server_ensure = present
  $server            = false

}

    'cnhgo.local': {
  $agent             = true
  $agent_ocs_mode    = 'cron'
  $agent_ocs_pause   = 100
  $agent_ocs_server  = 'inventario'
  $agent_ocs_tag     = 'CNH-GO'  
  $pkg_agent_ensure  = present
  $pkg_server_ensure = present
  $server            = false

}

    'cnhrs.local': {
  $agent             = true
  $agent_ocs_mode    = 'cron'
  $agent_ocs_pause   = 100
  $agent_ocs_server  = 'inventario'
  $agent_ocs_tag     = 'CNH-RS'  
  $pkg_agent_ensure  = present
  $pkg_server_ensure = present
  $server            = false

}

    'cnhsp.local': {
  $agent             = true
  $agent_ocs_mode    = 'cron'
  $agent_ocs_pause   = 100
  $agent_ocs_server  = 'inventario'
  $agent_ocs_tag     = 'CNH-SP'  
  $pkg_agent_ensure  = present
  $pkg_server_ensure = present
  $server            = false

}



}

 
  case $::osfamily {
    'RedHat': {
      $config_dir         = '/etc/ocsinventory'
      $config_dir_mode    = '0750'
      $config_dir_recurse = false
      $config_file_mode   = '0640'
      $config_group       = 'root'
      $config_user        = 'root'
      $log_dir_agent      = '/var/log/ocsinventory-agent'
      $log_dir_server     = '/var/log/ocsinventory-server'
      $pkg_deps           = undef

      $pkg_list_agent = [
        'ocsinventory-agent',
#        'ocsinventory-ipdiscover',
      ]

      $pkg_list_server = [
        'ocsinventory',
        'ocsinventory-reports',
        'ocsinventory-server',
      ]
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

