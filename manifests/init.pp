# @summary Manage containerd
#
# @example
#   include containerd
#
# @param ensure ensure flag for all resources
#
class containerd (
  Enum['present', 'absent'] $ensure = 'present',
) {
  include containerd::repo

  file { '/etc/containerd':
    ensure  => stdlib::ensure($ensure, 'directory'),
    force   => true,
    purge   => true,
    recurse => true,
  }

  -> file { '/etc/containerd/config.toml':
    ensure  => stdlib::ensure($ensure, 'file'),
    content => epp('containerd/config.toml'),
  }

  -> package { 'containerd':
    ensure => stdlib::ensure($ensure, 'package'),
  }

  service { 'containerd':
    ensure    => stdlib::ensure($ensure, 'service'),
    require   => Package['containerd'],
    subscribe => File['/etc/containerd/config.toml'],
  }
}
