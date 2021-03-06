# == Class ocsinventory
#
# $agent::                Enabled/disable the agent.
#                         Default: true.
#
# $agent_ocs_mode         Set agent's OCS mode, change to 'cron' to enable.
#                         Default: cron.
#
# $agent_ocs_pause        Specify who long to wait before sending inventory.
#                         Default: 100.
#
# $agent_ocs_server       Specify which server to send reports to.
#                         Default: undef
#
# $agent_ocs_tag          Specify an administrative tag.
#                         Default: undef.
#
# $config_dir::           Location of the main configuration directory.
#                         Default: operating system specific.
#
# $config_dir_mode::      Posix file mode for configuration directories.
#                         Default: 0755.
#
# $config_dir_recurse::   Apply the same posix permissions as $config_dir to any
#                         directory contained in $config_dir.
#                         Default: false.
#
# $config_file_mode::     Posix file mode for configuration files.
#                         Default: 0644.
#
# $config_group::         Posix group for configuration files.
#                         Default: operating system specific.
#
# $config_purge::         Whether or not to purge non-puppet managed files
#                         contained in $config_dir.
#                         Default: operating system specific.
#
# $config_user::          Posix user for configuration files.
#                         Default: operating system specific.
#
# $log_dir::              Specify directory containing log files.
#                         Default: operating system specific.
#
# $pkg_deps::             Any dependencies that need to be resolved before
#                         installing the main package.
#                         Default: operating system specific.
#
# $pkg_ensure::           Ensure state for packages.
#                         Default: present.
#
# $pkg_list::             An array containing the main package and possibly
#                         a number of dependencies.
#                         Default: operating system specific.
#
# $server::               Enable/disable server.
#                         Default: false.
#
class ocsinventory (
  $agent              = $::ocsinventory::params::agent,
  $agent_ocs_mode     = $::ocsinventory::params::agent_ocs_mode,
  $agent_ocs_pause    = $::ocsinventory::params::agent_ocs_pause,
  $agent_ocs_server   = $::ocsinventory::params::agent_ocs_server,
  $agent_ocs_tag      = $::ocsinventory::params::agent_ocs_tag,
  $config_dir         = $::ocsinventory::params::config_dir,
  $config_dir_mode    = $::ocsinventory::params::config_dir_mode,
  $config_dir_recurse = $::ocsinventory::params::config_dir_recurse,
  $config_file_mode   = $::ocsinventory::params::config_file_mode,
  $config_group       = $::ocsinventory::params::config_group,
  $config_purge       = $::ocsinventory::params::config_purge,
  $config_user        = $::ocsinventory::params::config_user,
  $log_dir            = $::ocsinventory::params::log_dir,
  $log_dir_agent      = $::ocsinventory::params::log_dir_agent,
  $log_dir_server     = $::ocsinventory::params::log_dir_server,
  $pkg_agent_ensure   = $::ocsinventory::params::pkg_agent_ensure,
  $pkg_deps           = $::ocsinventory::params::pkg_deps,
  $pkg_ensure         = $::ocsinventory::params::pkg_ensure,
  $pkg_list_agent     = $::ocsinventory::params::pkg_list_agent,
  $pkg_list_server    = $::ocsinventory::params::pkg_list_server,
  $pkg_server_ensure  = $::ocsinventory::params::pkg_server_ensure,
  $server             = $::ocsinventory::params::server,
) inherits ocsinventory::params {
  
  class { 'ocsinventory::remi': } ->
  class { 'ocsinventory::install': } ->
  class { 'ocsinventory::config': } ->
  Class ['ocsinventory']

  validate_absolute_path ($config_dir)
}

