#!/bin/bash

# export http_proxy=
# export https_proxy=

# Installing vagrant public key
mkdir -pm 700 /home/vagrant/.ssh
curl -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Installing VBoxGuestAdditions
sudo -E yum -y install bzip2
sudo -E yum -y install gcc
sudo -E yum -y install kernel-devel-`uname -r`
sudo -E yum -y install perl

sudo mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
sudo umount /mnt
sudo /etc/rc.d/init.d/vboxadd setup
rm /home/vagrant/VBoxGuestAdditions.iso
