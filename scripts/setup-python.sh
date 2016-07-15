#!/bin/bash 
# assumes that XCode and XCode command line tools have been installed
#  xcode-select --install 
# assumes that gfortran has been installed 
#  https://gcc.gnu.org/wiki/GFortranBinaries

# install pyenv & set 2.7.11 as current 
#  See: https://github.com/yyuu/pyenv-installer
#  See: https://github.com/yyuu/pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
pyenv install 2.7.11 
pyenv install 3.5.1 
pyenv global 2.7.11 3.5.1  # makes 2.7.11 the default and as python2.7, makes 3.5.1 available as python3.5

# install pip
curl -O https://bootstrap.pypa.io/get-pip.py 
python2.7 get-pip.py 
python3.5 get-pip.py


# Install virtualenv
pip2.7 install virtualenv 
pip3.5 install virtualenv

