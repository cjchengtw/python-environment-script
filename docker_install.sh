#! /bin/bash
   
echo $SYS_PASSWORD | sudo apt update

echo $SYS_PASSWORD | sudo -S apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    
    
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | echo $SYS_PASSWORD | sudo -S apt-key add -
 
echo $SYS_PASSWORD | sudo -S add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
   
echo $SYS_PASSWORD | sudo apt update
