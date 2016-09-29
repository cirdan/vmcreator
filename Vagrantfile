# PIM et SITE :
#debian 7.11
#php 5.4.45-0+deb7u4
#mysql 5.5.52-0+deb7u2-log

Vagrant.require_version '>= 1.8.1'
VAGRANTFILE_API_VERSION = '2'

require 'json'

server = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'local/projects.json')))

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define server['vm_name'] do |srv|
    srv.vm.box = server['box']
    srv.ssh.forward_agent = true
#    srv.vm.network "private_network", type: "dhcp"
    srv.vm.network "private_network", ip: server['ip_addr']
#    srv.vm.network "public_network"#, ip: server['ip_addr']
    srv.vm.synced_folder "www/", "/var/www", type: "nfs"
    # Disable the automount of current folder
    server.vm.synced_folder ".", "/vagrant", disabled: true
#      :owner => 'vagrant',
#      :group => 'www-data',
#      :mount_options => ["dmode=775","fmode=666"]
    # First of all, we need to provide access to this server to the ansible user
    #srv.vm.provision "file", 
    #  source: "local/authorized_keys", 
    #  destination: "~/.ssh/authorized_keys"
    config.vm.provision "shell",
      privileged: false,
      path: "insertKeys.sh"
  end
end
