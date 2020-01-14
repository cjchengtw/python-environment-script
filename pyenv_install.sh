#!bin/bash

# exit if any error occurs
set -e
export SYS_PASSWORD=0000
export DEBIAN_FRONTEND=noninteractive
# Ubuntu 18.04 system update and install related dependices 
echo "========== System Update.... =========="
echo $SYS_PASSWORD | sudo -S apt update  -y

echo "====== Update Again ======"
echo $SYS_PASSWORD | sudo -S apt update -y
echo "Update Finish"

echo "========== Install Dependencies ========="
echo $SYS_PASSWORD | sudo -S dpkg --configure -a
echo $SYS_PASSWORD | sudo -S apt install make gcc git vim curl build-essential libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev make gcc  zlib1g-dev -y
echo $SYS_PASSWORD | sudo -S dpkg --configure -a
echo "=== Installed ==="


# install pyenv
echo "========== Install pyenv using curl =========="
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash 
echo "========== Installed =========="

# set environment variables
echo "========== Setting Environment Variables =========="
ex -sc '$a
export PATH="/$HOME/.pyenv/bin:$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PIPENV_VENV_IN_PROJECT=1
.
$-,$!uniq
x' ~/.bashrc

echo "========== Finish Setting =========="

# activate the shell config
echo "Activate shell"
. ~/.bashrc
echo "Activated"
