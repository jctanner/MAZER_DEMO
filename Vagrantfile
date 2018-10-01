# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo 'root:vagrant' | chpasswd
echo 'vagrant:vagrant' | chpasswd
sed -i.bak 's/PasswordAuthentication\ no/PasswordAuthentication\ yes/' /etc/ssh/sshd_config
service sshd restart
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/28-cloud-base"
  config.vbguest.auto_update = false
  config.ssh.forward_agent = true
  config.vm.provision "shell", inline: $script
  config.vm.network "private_network", ip: "10.0.0.101"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
end
