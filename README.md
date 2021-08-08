# Basic Appliance Image

## Provided services

   * Mosquitto MQTT [Port 1833]
   * Node Red + Default Flow [Port 1880]
   * Avahi - integrated
   * Portainer [Port 9000]

## Part 1: How to start a Base Appliance

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

3.  SSH into your Raspberry Pi and login with the default username and password:
* Username:pi
* Password: raspberry
* Please don't forget to change your default password with `raspi-config`

4. Update your System and Reboot your appliance first.

`sudo apt-get update -y && sudo apt-get upgrade -y`
`sudo reboot`


5. After the reboot run the following Script after the installation and configuration end

`curl -sSL https://raw.githubusercontent.com/digitalhhz/appliance/main/docker.sh | sh`

6. Test your appliance by visiting Portainer [your-ip-address:9000] or Node Red [your-ip-address:1880]


## Part 2: How to build a new Custom Appliance


1. To have a connection to the Base Appliance - Fork this Repo and clone your new repository to your target application hardware.

`sudo git clone`

2. Build your custom app (web app, node-red flows, ... ) 

   * build it directly on the desired target architecture (e.g. arm64 v7)
   * otherwise in Step 5 you will need to use `docker buildx` (https://docs.docker.com/buildx/working-with-buildx/) in order to define on which platform(s) the image will be used


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

1. My Containers are not starting

Please reboot your appliance with 
`sudo reboot`
