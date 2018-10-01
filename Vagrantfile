# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo 'root:vagrant' | chpasswd
echo 'vagrant:vagrant' | chpasswd
sed -i.bak 's/PasswordAuthentication\ no/PasswordAuthentication\ yes/' /etc/ssh/sshd_config
service sshd restart
which python || dnf -y install python
which virtualenv || dnf -y install python2-virtualenv
which git || dnf -y install git
dnf -y install ansible || rpm -e --nodeps ansible
which gcc || dnf -y install gcc python-devel
dnf -y install dnf-plugins-core
dnf -y config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
dnf -y install docker-ce
systemctl enable docker ; systemctl start docker
groupadd docker && gpasswd -a vagrant docker && systemctl restart docker
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/28-cloud-base"
  config.vbguest.auto_update = false
  config.ssh.forward_agent = true
  config.vm.provision "shell", inline: $script
  config.vm.network "private_network", ip: "10.0.0.101"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
end
