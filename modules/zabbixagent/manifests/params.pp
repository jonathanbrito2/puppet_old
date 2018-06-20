# Parameters used by this module
class zabbixagent::params {
  # perinstall settings
  $manage_repo_epel       = true
  $manage_repo_zabbix     = true

  # install settings
  $ensure_setting         = 'present'
  $custom_require_linux   = undef
  $custom_require_windows = undef

  # config settings
  $allow_root             = undef
  $buffer_send            = undef
  $buffer_size            = undef
  $debug_level            = undef
  $enable_remote_commands = undef
  $host_metadata          = undef
  $host_metadata_item     = 'system.uname'
  $hostname               = downcase($::fqdn)
  $hostname_item          = undef
  $include_files          = undef
  $item_alias             = undef
  $listen_ip              = undef
  $listen_port            = undef
  $load_module            = undef
  $load_module_path       = undef
  $log_file_size          = 0
  $log_remote_commands    = undef
  $max_lines_per_second   = undef
  $perf_counter           = undef
  $pid_file               = '/var/run/zabbix/zabbix_agentd.pid'
  $refresh_active_checks  = undef
  $server                 = 'vmalfeu'
  $server_active          = 'vmalfeu'
  $source_ip              = undef
  $start_agents           = 3
  $timeout                = undef
  $unsafe_user_parameters = undef
  $user_parameter         = undef
  $user                   = undef

  # this isn't a parameter but, since this class is inherited by all classes
  # it is a good place to put this message so that it's the same everywhere
  $fail_message           = "${::kernel} is not yet supported by this module."

  case $::kernel {
    'Linux'   : {
      $config_dir = '/etc/zabbix'
      $log_file   = '/var/log/zabbix/zabbix_agentd.log'
    }

    'Windows' : {
      $config_dir = 'C:/ProgramData/zabbix'
      $log_file   = 'C:/zabbix_agentd.log'
    }

    default   : {
      fail($fail_message)
    }

  } # end case

  $service_name = $::operatingsystem ? {
    'Windows'            => 'Zabbix Agent',
    /(OpenSuSE|SLES)/    => 'zabbix-agentd',
    default              => 'zabbix-agent',
  }

  $config_name = $::operatingsystem ? {
    'Windows'            => 'zabbix_agentd.conf',
    /(OpenSuSE|SLES)/    => 'zabbix-agentd.conf',
    default              => 'zabbix_agentd.conf',
  }
}
