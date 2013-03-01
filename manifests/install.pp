#------------------------------------------------------------------------------
# Class: kvm::install
#
#   This class is part of the kvm module.
#   You should not be calling this class.
#   The delegated class is Class['kvm'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-01
#
#------------------------------------------------------------------------------
class kvm::install {

    # Collect variables:
    $version  = getvar("${module_name}::version")
    $packages = getvar("${module_name}::params::packages")

    # Install the package/s:
    package { $packages: ensure => $version }
}
