# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`containerd`](#containerd): Manage containerd
* [`containerd::repo`](#containerd--repo): Adds repositories for some systems

## Classes

### <a name="containerd"></a>`containerd`

Manage containerd

#### Examples

##### 

```puppet
include containerd
```

#### Parameters

The following parameters are available in the `containerd` class:

* [`ensure`](#-containerd--ensure)

##### <a name="-containerd--ensure"></a>`ensure`

Data type: `Enum['present', 'absent']`

ensure flag for all resources

Default value: `'present'`

### <a name="containerd--repo"></a>`containerd::repo`

Adds repositories for some systems

#### Parameters

The following parameters are available in the `containerd::repo` class:

* [`dnf_config`](#-containerd--repo--dnf_config)

##### <a name="-containerd--repo--dnf_config"></a>`dnf_config`

Data type: `Hash`

The DNF repository configuration
