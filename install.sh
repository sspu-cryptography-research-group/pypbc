#!/bin/bash
echo "Installing pypbc..." &&
sudo apt update &&
sudo apt-get install -y python3-pip &&
sudo pip3 install virtualenv virtualenvwrapper &&
virtualenv cryptoenv &&
source cryptoenv/bin/activate &&
sudo apt-get install -y libgmp-dev && 
sudo apt-get install -y build-essential flex bison &&
wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz &&
tar -xf pbc-0.5.14.tar.gz &&
cd pbc-0.5.14 &&
./configure --prefix=/usr --enable-shared &&
make &&
sudo make install &&
sudo ldconfig &&
cd .. &&
sudo ./cryptoenv/bin/pip3 install ./pypbc &&
find . -name "*pbc*" -exec rm -rf {} + &&
echo "pypbc installed successfully!"
