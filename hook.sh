#! /bin/bash
export SYS_PASSWORD=0000
# . ~/.bashrc
wget https://raw.githubusercontent.com/cjchengtw/python-environment-script/master/pipenv_install.sh
wget https://raw.githubusercontent.com/cjchengtw/python-environment-script/master/pyenv_install.sh
wget https://raw.githubusercontent.com/cjchengtw/python-environment-script/master/docker_install.sh
PYENV_INSTALL="./pyenv_install.sh" 
PIPENV_INSTALL="./pipenv_install.sh"
DOCKER_INSTALL="./docker_install.sh"
bash "$PYENV_INSTALL"
bash "$PIPENV_INSTALL"
bash "$DOCKER_INSTALL"
