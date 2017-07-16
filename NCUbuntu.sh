#!/bin/bash
chmod u+x NCUbuntu.sh

# Northcoders Ubuntu Installation
# tested on Ubuntu 16.04, 15th July 2017 

# Google Chrome:
sudo apt-get update
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# Visual Studio Code:
sudo apt-get update
sudo apt-get install -y curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code

# Git:
sudo apt-get update
sudo apt-get install -y git

# Terminator:
sudo apt-get update
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get install -y terminator

# OhMyZsh:
sudo apt-get update
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd /usr/local/share/zsh
sudo chmod -R 755 ./site-functions
sudo chown -R root:root ./site-functions
cd

# Node and NPM:
sudo apt-get update
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo mkdir /usr/local/lib/node_modules
sudo chown -R $(whoami) /usr/local/lib/node_modules
sudo chown -R $(whoami) /usr/local
sudo chown -R $(whoami) /usr/local/lib
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
# NB: update this line as new versions of Node are released:
sudo ln -sf /usr/local/n/versions/node/8.0.0/bin/node /usr/bin/node 

# MongoDB:
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Postgres.app:
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib

# all the essential NPM libraries:
npm install -g mocha eslint webpack nodemon

# Postman:
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman

# then finally...
sudo apt-get update
sudo apt-get upgrade
