#------------------------------------------------------------------------------
# Class: kvm
#
#   This module manages the KVM hypervisor.
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-01
#
#   Tested platforms:
#       - CentOS 6
#
# Parameters:
#
# Actions:
#
#   Installs, configures and manages the KVM hypervisor.
#
# Sample Usage:
#
#   include kvm
#
#   or
#
#   class { 'kvm': }
#
#   or
#
#   class { 'kvm':
#       version  => present,
#       ksm      => 'running',
#       ksmtuned => 'running',
#   }
#
#------------------------------------------------------------------------------
class kvm (

    $version  = undef,
    $ksm      = undef,
    $ksmtuned = undef,

) {

    # Validate parameters:
    validate_re($version, '^present$|^latest$')
    validate_re($ksm, '^running$|^stopped$')
    validate_re($ksmtuned, '^running$|^stopped$')

    # Register this module:
    if defined(Class['motd']) { motd::register { $module_name: } }

    # Set the requirements:
    anchor { "${module_name}::begin":   } ->
    class  { "${module_name}::params":  } ->
    class  { "${module_name}::install": } ->
    class  { "${module_name}::config":  } ~>
    class  { "${module_name}::service": } ->
    anchor { "${module_name}::end":     }
}
