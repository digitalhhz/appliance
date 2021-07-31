#! /bin/sh
echo "(1) System Updaten"
sudo apt-get update -y && sudo apt-get upgrade -y
echo "(2) Docker installieren"
curl -sSL https://get.docker.com | sh
sudo gpasswd -a $USER docker
newgrp docker
echo "(3) Python installieren"
sudo apt-get install -y libffi-dev libssl-dev
sudo apt install -y python3-dev
sudo apt-get install -y python3 python3-pip
echo "(4) Docker compose installieren und aktivieren"
sudo pip3 install docker-compose
sudo systemctl enable docker
echo "(5) Git installieren"
sudo apt install -y git
echo "(6) Umgebung vorbereiten"
sudo git clone https://github.com/digitalhhz/appliance.git
echo "(7) Container hochfahren"
cd appliance
sudo docker volume create portainer_data
sudo chown -R 1000:1000 ./nodered
sudo docker-compose up -d
