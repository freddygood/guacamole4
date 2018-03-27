$build_script = <<-SCRIPT
echo I am provisioning...
cd /tmp
apt-get update
apt-get install -y git
git clone https://github.com/freddygood/guacamole4.git
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "salt-master" do |salt_master|
    salt_master.vm.box = "ubuntu/xenial64"
    salt_master.vm.hostname = "salt-master"
    salt_master.vm.network "private_network", type: "dhcp"

    salt_master.vm.provision :salt do |salt|
      install_master = true
    end
  end

  config.vm.define "salt-minion" do |salt_minion|
    salt_minion.vm.box = "ubuntu/xenial64"
    salt_minion.vm.hostname = "salt-minion"
    salt_minion.vm.network "private_network", type: "dhcp"
    salt_minion.vm.network "forwarded_port", guest: 8080, host: 8080

    salt_minion.vm.provision :salt do |salt|
      salt.run_highstate = false
    end
  end

  config.vm.define "build" do |build|
    build.vm.box = "ubuntu/xenial64"
    build.vm.hostname = "build"
    build.vm.network "private_network", type: "dhcp"
    build.vm.network "forwarded_port", guest: 8080, host: 8081
    build.vm.provision "shell", inline: $build_script
  end
end
