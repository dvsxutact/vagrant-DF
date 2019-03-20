# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrant virtual environments for SQL Server 2017 on Ubuntu Linux
Vagrant.configure(2) do |config|
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb, override|
    vb.name = "vagrant-dreamfactory"
    vb.memory = "2048"
    vb.cpus = 2
    
    # Do not use official Ubuntu box, broken in many ways https://bugs.launchpad.net/cloud-images/+bug/1569237
    override.vm.box = "bento/ubuntu-16.04"
    override.vm.network "private_network", type: "dhcp"
    override.vm.network :forwarded_port, host: 8070, guest: 80 # dreamfactory
    override.vm.synced_folder ".", "/vagrant", disabled: false
  end
  
  scripts = [ "bootstrap.sh", "install-mysql.sh", "mysql_secure.sh", "configure-mysql.sh", "install-dreamfactory.sh", "install-nginx.sh"]
  scripts.each { |script|
    config.vm.provision :shell, privileged: false, :path => "./" << script
  }
end
