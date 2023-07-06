# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include containerd::repo
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
