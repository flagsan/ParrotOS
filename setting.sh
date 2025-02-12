#!/bin/bash
# Prerequires: git clone https://github.com/flagsan/ParrotOS.git

sudo apt update

# Create Tools directory
mkdir -p ~/Tools/Linux
mkdir -p ~/Tools/Windows
mkdir -p ~/Tools/Common

# Install Poetry dependencies
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
cp ./poetry.lock ~/Tools
cp ./pyproject.toml ~/Tools
poetry --directory ~/Tools install

# Install apt packages
sudo apt install -y \
  seclists \
  enum4linux-ng \
  ffuf \
  mlocate \
  ftp \
  jd-gui \
  cadaver \
  peass \
  exploitdb \
  bloodhound \
  dnsrecon \
  freerdp2-x11 \
  snmp \
  exiftool \
  powershell-empire \
  mingw-w64
  
sudo apt clean

# install powershell
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian?view=powershell-7.5
wget -q https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
sudo apt-get clean

# --- Linux --- #
# Install pspy binaries
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32 -O ~/Tools/Linux/pspy32
chmod +x ~/Tools/Linux/pspy32
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64 -O ~/Tools/Linux/pspy64

# Install chisel binaries
wget https://github.com/jpillora/chisel/releases/download/v1.10.1/chisel_1.10.1_linux_amd64.gz -O ~/Tools/Linux/chisel_1.10.1_linux_amd64.gz
gunzip ~/Tools/Linux/chisel_1.10.1_linux_amd64.gz
chmod +x ~/Tools/Linux/chisel_1.10.1_linux_amd64
rm ~/Tools/Linux/chisel_1.10.1_linux_amd64.gz

# --- Windows --- #
# Windows Exploit Suggester
git clone https://github.com/Pwnistry/Windows-Exploit-Suggester-python3.git ~/Tools/Windows/Windows-Exploit-Suggester-python3

# PSTools
wget https://download.sysinternals.com/files/PSTools.zip -O ~/Tools/Windows/PSTools.zip
unzip ~/Tools/Windows/PSTools.zip -d ~/Tools/Windows/PSTools
rm ~/Tools/Windows/PSTools.zip
