#!/bin/bash

# install python version by pyenv
echo "Install PYthon by pyenv"
pyenv install 3.7.6
echo "Installed python sussessfully"

# change to the system versin
echo "Change python version"
pyenv global  3.7.6
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
