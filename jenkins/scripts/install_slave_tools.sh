# install pip
wget -q https://bootstrap.pypa.io/get-pip.py
python get-pip.py
python3 get-pip.py
rm -f get-pip.py

# install awscli
pip install awscli

# install terraform
cd /usr/local/bin
wget -q https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
unzip terraform_0.11.3_linux_amd64.zip

# install packer
wget -q https://releases.hashicorp.com/packer/1.2.0/packer_1.2.0_linux_amd64.zip
unzip packer_1.2.0_linux_amd64.zip

# clean up
apt-get clean
rm terraform_0.11.3_linux_amd64.zip
rm packer_1.2.0_linux_amd64.zip
