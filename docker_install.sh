#! /bin/bash
#set -e
export SYS_PASSWORD=0000

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
echo $SYS_PASSWORD | sudo usermod -aG docker $USER
echo "Done"
