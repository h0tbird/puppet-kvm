#------------------------------------------------------------------------------
# Class: kvm::config
#
#   This class is part of the kvm module.
#   You should not be calling this class.
#   The delegated class is Class['kvm'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-01
#
#------------------------------------------------------------------------------
class kvm::config {

    # Collect variables:
    $templates = getvar("${module_name}::params::templates")
    $configs   = getvar("${module_name}::params::configs")

    # Install the configuration files:
}
