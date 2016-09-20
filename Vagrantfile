# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define :mgmt do |mgmt_config|
      mgmt_config.vm.box = "nrel/CentOS-6.5-x86_64"
      mgmt_config.vm.hostname = "mgmt"
      mgmt_config.vm.network :private_network, ip: "10.0.15.10"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
  end

  # create load balancer
  config.vm.define :lbserver do |lb_config|
      lb_config.vm.box = "nrel/CentOS-6.5-x86_64"
      lb_config.vm.hostname = "lbserver"
      lb_config.vm.network :private_network, ip: "10.0.15.11"
      lb_config.vm.network "forwarded_port", guest: 80, host: 8888
      lb_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

  # create some web servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..2).each do |i|
    config.vm.define "webserver#{i}" do |node|
        node.vm.box = "nrel/CentOS-6.5-x86_64"
        node.vm.hostname = "webserver#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
    end
  end

  # create database
  config.vm.define :dbserver do |db_config|
      db_config.vm.box = "nrel/CentOS-6.5-x86_64"
      db_config.vm.hostname = "dbserver"
      db_config.vm.network :private_network, ip: "10.0.15.23"
      db_config.vm.network "forwarded_port", guest: 80, host: 8083
      db_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

  # create monitoring
  config.vm.define :nagios do |nagio_config|
      nagio_config.vm.box = "nrel/CentOS-6.5-x86_64"
      nagio_config.vm.hostname = "nagios"
      nagio_config.vm.network :private_network, ip: "10.0.15.24"
      nagio_config.vm.network "forwarded_port", guest: 80, host: 8084
      nagio_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end
end
