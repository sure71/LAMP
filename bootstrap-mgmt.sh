#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
#apt-get -y install software-properties-common
#apt-add-repository -y ppa:ansible/ansible
#apt-get update
#apt-get -y install ansible
yum install epel-release -y
yum install ansible -y 

# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/HAproxy/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.11  lbserver
10.0.15.21  webserver1
10.0.15.22  webserver2
10.0.15.23  dbserver
10.0.15.24  nagios
EOL
