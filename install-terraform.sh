#!/usr/bin/env bash
sudo apt update
sudo apt install jq
set -e
sudo apt-get install unzip
cd /tmp
wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
unzip terraform_0.12.20_linux_amd64.zip 
sudo mv terraform /usr/local/bin
cd
terraform --version

