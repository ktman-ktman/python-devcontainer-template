#!/bin/bash

start_pwd=${PWD}

# dotfiles
git clone https://github.com/ktman-ktman/dotfiles.git ~/
cd ~/dotfiles
./install_vscode.sh
cd ${start_pwd}

# poetry
poetry install