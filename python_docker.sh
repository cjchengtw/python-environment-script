#!/bin/bash

export SYS_PASSWORD=0000

# install python version by pyenv
echo "Install PYthon by pyenv"
pyenv install 3.7.3
echo "Installed python sussessfully"

# change to the system versin
echo "Change python version"
pyenv global  3.7.3
echo "Changed python version"

# upgrade pip
echo "Upgrade pip"
python3 -m ensurepip --user --upgrade
echo "Upgraded pip"

# install pipx
echo "Install pipx..."
python3 -m pip install --user pipx
python3 -m pipx ensurepath
echo "Installed pipx"

# install pipenv
echo "Install pipenv"
pipx install pipenv
echo "Installed pipenv"

# install jupyter lab
echo "Install jupyter lab"
pipx install jupyterlab
echo "Done"

# install pycryptodome
echo "Install pycryptodome"
python3 -m pip install --user pycryptodome
echo "Done"

echo "Install dependencies"
echo $SYS_PASSWORD | sudo -S apt install apt-transport-https ca-certificates curl software-properties-common -y
echo "Done"

echo "Add key"
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | echo $SYS_PASSWORD | sudo apt-key add -
wget https://download.docker.com/linux/ubuntu/gpg
echo $SYS_PASSWORD | sudo -S  apt-key add  gpg
echo "Done"

echo "Verify key"
echo $SYS_PASSWORD | sudo -S  apt-key fingerprint 0EBFCD88
echo "Done"

echo "Add apt repository"
echo $SYS_PASSWORD | sudo -S add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "Done"

echo "System Update Again"
echo $SYS_PASSWORD | sudo -S  apt update -y
echo "Done"

echo "Install Docker CE"
echo $SYS_PASSWORD | sudo -S  apt  install docker-ce -y
echo "Done"

echo "Start and Enable docker service"
echo $SYS_PASSWORD |  sudo -S systemctl start docker.service
echo $SYS_PASSWORD |  sudo -S systemctl enable docker.service

echo "Add user to group"
echo $SYS_PASSWORD | sudo  -aG docker $USER
echo "Done"
