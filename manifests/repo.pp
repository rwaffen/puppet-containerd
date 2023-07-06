# @summary Adds repositories for some systems
#
# @param dnf_config The DNF repository configuration
#
class containerd::repo (
  Hash $dnf_config,
) {
  case fact('os.family') {
    'RedHat': {
      yumrepo { 'docker-ce-stable':
        * => $dnf_config,
      }
    }
    default: {}
  }
}
