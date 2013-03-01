#------------------------------------------------------------------------------
# Class: kvm::params
#
#   This class is part of the kvm module.
#   You should not be calling this class.
#   The delegated class is Class['kvm'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-01
#
#------------------------------------------------------------------------------
class kvm::params {

    # Set location for files and templates:
    $files     = "puppet:///modules/${module_name}/${::operatingsystem}"
    $templates = "${module_name}/${::operatingsystem}"

    # Set OS specifics:
    case $::osfamily {

        'RedHat': {
            $packages = ['qemu-kvm']
            $configs  = [ ]
            $services = ['ksm','ksmtuned']
        }

        default: { fail("${module_name}::params ${::osfamily} family is not supported yet.") }
    }
}
