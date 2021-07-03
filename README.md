# Basic Appliance Image

## Provided services

* Mosquitto MQTT
* Node Red
* Avahi

## How to start

* Install Raspberry Pi OS on your new appliance
[Raspberry PI OS](https://www.raspberrypi.org/software/operating-systems/)

* Set up SSH and Internet Connection

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

* Run the following Script after the installation and configuration end

`curl -sSL https://github.com/digitalhhz/appliance/blob/main/docker.sh | sh`

## FAQ
