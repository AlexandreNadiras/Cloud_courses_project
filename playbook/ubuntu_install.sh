#!/bin/sh

export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
tzdata tzdata/Areas select Europe
tzdata tzdata/Zones/Europe select Paris

# Install system-wide packages

apt update
apt dist-upgrade -y
apt install -y git-core vim-nox htop tree tmux zsh curl python-pip python3-pip golang sudo



# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i s/robbyrussell/ys/ .zshrc
echo 'export PATH=$HOME/go/bin:$PATH' >> $HOME/.zshrc

# Install Packer

go get -v github.com/hashicorp/packer

# Install Terraform

go get -v github.com/hashicorp/terraform

# Install ansible

python3 -m pip install ansible

# Install the courses content

git clone https://github.com/remyleone/cloud-courses

