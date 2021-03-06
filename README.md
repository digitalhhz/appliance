# Basic Appliance Image

## Provided services

   * Mosquitto MQTT [Port 1833]
   * Node Red + Default Flow [Port 1880]
   * Avahi - integrated
   * Portainer [Port 9000]

## Part 1: How to start a Base Appliance

1. Install Raspberry Pi OS on your new appliance
[Raspberry PI OS](https://www.raspberrypi.org/software/operating-systems/)
Raspberry Pi OS Lite should be enough for most of the Use Cases.

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


1. Build your custom app (web app, node-red flows, ... ) 

   * build it directly on the desired target architecture (e.g. arm64 v7)
   * otherwise in Step 5 you will need to use `docker buildx` (https://docs.docker.com/buildx/working-with-buildx/) in order to define on which platform(s) the image will be used
   * all the next steps will be done on a Raspberry Pi 4 (arm64 v7)

2. Adjust your Dockerfile as needed (example file in this repo)

`sudo nano Dockerfile`

Example A: New Node Red Flow and new Node Red Module (e.g. node-red-dashboard)

```FROM nodered/node-red
# Start with Node Red Base Image
FROM nodered/node-red
# Install node-red-dashboard module with npm
RUN npm install node-red-dashboard
# Copy all the relevant files
COPY nodered/settings.js /data/settings.js
COPY nodered/flows.json /data/flows.json
COPY nodered/flows_cred.json /data/flows_cred.json
```
3. Adjust your docker-compose.yml file and add your new image configuration details. In the example below I replaced the original Node Red Image with my customized image

```
  nodered:
    image: digitalhhz/your-image-name:latest
    ports:
      - "1880:1880"
    volumes:
      - ./nodered:/data
    restart: always
```
4. Build your new image from the /appliance directory or where your Dockerfile is located

`sudo docker build -t your-image-name:latest .`

Don't forget the '.' at the end of the docker build command :) 

5. [Optional] Login to docker if you like to publish the docker image to a Registry

`sudo docker login`

6. [Optional] Tag your image

`sudo docker image tag your-image-name digitalhhz/your-image-name:latest`

7. [Optional]Push your new image to the Docker Registry

`sudo docker push digitalhhz/your-image-name:latest`

8. Now you have build and published your new Custom Appliance. In order to test it please :

* stop your running docker containers from the Base Appliance directory with `sudo docker-compose down`
* pull and start your test image e.g. `sudo docker run -it -p 1880:1880 digitalhhz/your-image-name:latest`

9. Example Appliance can be viewed here:

https://github.com/lizard91/appliance


## FAQ

If you habe any questions or concerns please raise an Issue Ticket. Questions und answers which will come up frequently will be documented here inside this FAQ.

1. My Containers are not starting

Please reboot your appliance with 
`sudo reboot`

2. Dockerfile best practices can be viewed at [Docker](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

3. Docker compose best practices can be viewed at [Github Docker](https://github.com/docker/awesome-compose)
