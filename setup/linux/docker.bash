#!/bin/bash
get_os_distribution() {
	if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
		# Check Ubuntu or Debian
		if [ -e /etc/lsb-release ]; then
			# Ubuntu
			distri_name="ubuntu"
		else
			# Debian
			distri_name="debian"
		fi
	fi

	echo "$distri_name"
}

os_dis=$(get_os_distribution)

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt update
sudo apt -y install \
	ca-certificates \
	gnupg \
	lsb-release

curl -fsSL https://download.docker.com/linux/"$os_dis"/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/${os_dis} $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo docker run hello-world

sudo groupadd docker
sudo usermod -a -G docker "$USER"
