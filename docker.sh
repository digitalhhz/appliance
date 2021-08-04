#! /bin/sh
echo "(1) Docker installieren"
curl -fsSL https://get.docker.com | sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
echo "(2) Python installieren"
sudo apt-get install -y libffi-dev libssl-dev
sudo apt install -y python3-dev
sudo apt-get install -y python3 python3-pip
echo "(3) Docker compose installieren und aktivieren"
sudo pip3 install docker-compose
sudo systemctl enable docker
echo "(4) Git installieren"
sudo apt install -y git
echo "(5) Umgebung vorbereiten"
sudo git clone https://github.com/digitalhhz/appliance.git
echo "(6) Container hochfahren"
cd appliance
sudo docker volume create portainer_data
sudo chown -R 1000:1000 ./nodered
sudo docker-compose up -d
