#!/bin/bash

#fix Broken install
sudo apt --fix-broken install
#update 
sudo apt update; sudo apt upgrade -y

#fix any broken packages 
sudo apt-get -f install -y

#install clinfo
sudo apt install clinfo -y

#download amd drivers
wget https://repo.radeon.com/amdgpu-install/21.50/ubuntu/focal/amdgpu-install_21.50.50000-1_all.deb

#install amd drivers

sudo dpkg -i amdgpu-install_21.50.50000-1_all.deb 
sudo apt --fix-broken install
sudo dpkg -i amdgpu-install_21.50.50000-1_all.deb -y
sudo amdgpu-install --usecase=graphics,opencl,openclsdk --no-dkms --no-32 --accept-eula -y
sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)" -y
sudo usermod -a -G render,video $LOGNAME 
sudo apt install amdgpu-dkms -y

#Download janusminer

wget https://github.com/CoinFuMasterShifu/janusminer/releases/download/0.2.5/janusminer-ubuntu20

#executable permission 
chmod +x janusminer-ubuntu20

#Create Minerscreen 

screen -S miner

#run janusminer
./janusminer-ubuntu20 -a 059cfbc69c57c126f224119561c7921596584f373124718a -h 192.168.1.94
