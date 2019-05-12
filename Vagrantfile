## https://www.vagrantup.com/intro/getting-started/boxes.html
## Example: https://github.com/geerlingguy/ansible-vagrant-examples/blob/master/lamp/Vagrantfile
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Maps to a local box. @TODO should be replaced by a cloud hosted box
  config.vm.box = "docfav"
  config.vm.network "private_network", ip: "192.168.33.10"
  
  config.vm.provider :virtualbox do |v|
    v.name = "docfav"
    v.memory = 2048
    v.cpus = 2
    # Boost Networking performance
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    # To disable packer log creation finding. Crashes at start otherwise
    #v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
  end

  # @TODO nfs crashes even when nfs-common and nfs-server-kernel installed
  # nfs gives better performance even for bigger project
  #config.vm.synced_folder ".", "/var/www/docfav", type: "nfs"
  config.vm.synced_folder ".", "/var/www/docfav", :owner => "www-data", :group => "www-data"
  ## Check for updates
  config.vm.box_check_update = true
  
  # @TODO https support
  #config.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true
  

  config.ssh.username = 'docfav'
  config.ssh.password = 'docfav'
  config.ssh.keys_only = false
  config.ssh.insert_key = false

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :docfav do |docfav|
  end

end
