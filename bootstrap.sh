#!/usr/bin/env bash

apt-get update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install node
sudo apt-get install -y npm
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb
sudo systemctl start mongod
sudo systemctl enable mongod
sudo apt-get install -y postgresql postgresql-contrib
sudo su - postgres -c "createuser vagrant"
sudo mkdir /data
sudo mkdir /data/db
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant
