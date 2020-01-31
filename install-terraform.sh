#!/usr/bin/env bash
cd ..
mv terraform.tfvars ~/f5-as3-usecases
cd /tmp
wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
unzip terraform_0.12.20_linux_amd64.zip 
sudo mv terraform /usr/local/bin
cd ~/f5-as3-usecases
terraform --version
terraform init
echo "Waiting for F5 BIG-IP to be ready ......"
sleep 50
echo "F5 BIG-IP is  ready"
