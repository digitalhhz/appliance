#! /bin/sh
echo "(1) System Updaten"
sudo apt-get update && sudo apt-get upgrade
echo "(2) Docker installieren"
curl -sSL https://get.docker.com | sh
echo "(3) Python installieren"
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
echo "(4) Docker compose installieren und aktivieren"
sudo pip3 install docker-compose
sudo systemctl enable docker
echo "(5) Git installieren"
sudo apt install git
echo "(6) Umgebung vorbereiten"
sudo git clone https://github.com/digitalhhz/appliance.git
echo "(7) Container hochfahren"
sudo docker-compose up -d
