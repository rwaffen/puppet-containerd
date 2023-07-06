# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  $bootstrap_script = <<-SCRIPT
    source /etc/os-release
    hostnamectl set-hostname $HOSTNAME.example.com

    if [ "${ID}" == "ubuntu" ]; then
      wget -4 https://apt.puppetlabs.com/puppet7-release-$UBUNTU_CODENAME.deb
      dpkg -i puppet7-release-$UBUNTU_CODENAME.deb
    fi

    if [ "${ID}" == "debian" ]; then
      wget -4 https://apt.puppetlabs.com/puppet7-release-$VERSION_CODENAME.deb
      dpkg -i puppet7-release-$VERSION_CODENAME.deb
    fi

    case "$ID" in
      "ubuntu" | "debian")
          apt update -y
          apt install -y puppet-agent
          rm -vf /etc/puppetlabs/code/environments/production/*.dpkg-dist
          rm -vf /etc/puppetlabs/code/environments/production/*.dpkg-new
          ;;
      *)
          echo
          ;;
      esac

    /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib

    # directly jump to root after login
    echo "sudo -i" >> /home/vagrant/.bashrc
  SCRIPT

  config.vm.define "ubuntu" do |worker|
    worker.vm.hostname = 'ubuntu.example.com'
    worker.vm.box = "ubuntu/jammy64" # Ubuntu 22.04
    worker.vm.synced_folder ".", "/etc/puppetlabs/code/environments/production/modules/containerd"
    worker.vm.synced_folder ".", "/vagrant"
    worker.vm.provision :shell, inline: $bootstrap_script
  end

  config.vm.define "debian" do |worker|
    worker.vm.hostname = 'debian.example.com'
    worker.vm.box = "debian/bullseye64" # Debian 11
    worker.vm.synced_folder ".", "/etc/puppetlabs/code/environments/production/modules/containerd"
    worker.vm.synced_folder ".", "/vagrant"
    worker.vm.provision :shell, inline: $bootstrap_script
  end

  config.vm.define "centos" do |worker|
    worker.vm.hostname = 'centos.example.com'
    worker.vm.box = "betadots/centos8p7"
    worker.vm.synced_folder ".", "/etc/puppetlabs/code/environments/production/modules/containerd"
    worker.vm.synced_folder ".", "/vagrant"
    worker.vm.provision :shell, inline: $bootstrap_script
  end
end
