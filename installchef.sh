#!/bin/bash
sudo yum install epel-release -y
sudo yum update -y
sudo yum install ansible -y

curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable

sudo mkdir -p /data/var/cache/yum

echo "Installing Cookbooks Now!"
echo "#############################################################################"
sudo chef-client --chef-license accept --local-mode --config-option chef_repo_path=/tmp/chef/ -o ct-baseimage -L /tmp/chef/chef.log
