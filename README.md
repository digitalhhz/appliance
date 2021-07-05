# Basic Appliance Image

## Provided services

* Mosquitto MQTT
* Node Red
* Avahi
* Portainer

## How to start

1. Install Raspberry Pi OS on your new appliance
[Raspberry PI OS](https://www.raspberrypi.org/software/operating-systems/)

2. Set up SSH and Internet Connection

  * For headless applaince you can create an empty file named **ssh**
  * Than create a file named **wpa_supplicant.conf** and enter the following content with the text editor of your choice

```country=DE # Your 2-digit country code
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
network={
    ssid="YOUR_NETWORK_NAME"
    psk="YOUR_PASSWORD"
    key_mgmt=WPA-PSK
}
```

3. Run the following Script after the installation and configuration end

`curl -sSL https://raw.githubusercontent.com/digitalhhz/appliance/main/docker.sh | sh`

## How to build a new application

0. To have a connection to the Base Appliance - Fork this Repo

1. Otherwise clone this base appliance repository

`sudo git clone`

2. Build your custom app (web app, node-red flows, ... )


3. Add, Commit and push your changes

`git add`
`git commit`
`git push`

4. Adjust your Dockerfile as needed (example in this repo)

5. Build your new image

`docker build -t your-image-name:your-tag .`

6. Tag your image if needed, e.g.

`sudo docker image tag nodered-dhhz digitalhhz/nodered-dhhz:latest`

7. Push your new image to the Docker Registry

`sudo docker push digitalhhz/nodered-dhhz:latest`

8. Example:

https://github.com/Andrew71423/appliance


## FAQ
