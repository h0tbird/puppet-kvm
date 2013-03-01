#------------------------------------------------------------------------------
# Class: kvm::service
#
#   This class is part of the kvm module.
#   You should not be calling kvm this class.
#   The delegated class is Class['kvm'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-03-01
#
#------------------------------------------------------------------------------
class kvm::service {

    # Collect variables:
    $ksm      = getvar("${module_name}::ksm")
    $ksmtuned = getvar("${module_name}::ksmtuned")
    $services = getvar("${module_name}::params::services")

    # Start or stop the service:
    service {
        $services[0]:
            ensure  => $ksm,
            enable  => $ksm ? {
                'running' => true,
                'stopped' => false,
            };
        $services[1]:
            ensure  => $ksmtuned,
            enable  => $ksmtuned ? {
                'running' => true,
                'stopped' => false,
            };
    }
}
