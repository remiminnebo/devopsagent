#!/bin/bash
# Ubuntu Base
echo "---------------------------------------------------------------------------------------------"
echo "Configure Ubuntu Base"
echo "---------------------------------------------------------------------------------------------"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y unzip
# Azure-Cli
echo "---------------------------------------------------------------------------------------------"
echo "Install Azure-Cli"
echo "---------------------------------------------------------------------------------------------"
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-get update
sudo apt-get install -y azure-cli
# Fix OmsAgentLinux
echo "---------------------------------------------------------------------------------------------"
echo "Install Fix : OmsAgentLinux"
echo "---------------------------------------------------------------------------------------------"
sudo apt-get install -y gdb
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
# Powershell
echo "---------------------------------------------------------------------------------------------"
echo "Install Powershell"
echo "---------------------------------------------------------------------------------------------"
sudo apt-get install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo add-apt-repository -y universe
sudo apt-get install -y powershell
# Kubernetes-Cli
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# Helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt install -y apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt update
sudo apt install -y helm