#! /bin/bash
wget https://raw.githubusercontent.com/cjchengtw/python-environment-script/master/pipenv_install.sh
wget https://raw.githubusercontent.com/cjchengtw/python-environment-script/master/pyenv_install.sh
PYENV_INSTALL="./pyenv-install.sh" 
PIPENV_INSTALL="./pipenv-install.sh"
bash "$PYENV_INSTALL"
bash "$PIPENV_INSTALL"
