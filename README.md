### Unofficial Docker Image for AdGuardHome
This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

![AdGuardHome](https://raw.githubusercontent.com/MrKsey/AdGuardHome/master/adh.PNG)

More info:
- https://github.com/AdguardTeam/AdGuardHome

### Requirements

* host with docker
* ~128 Mb RAM, ~100 Mb disk space 

## Usage

* docker host ip (for example) - 192.168.1.10 .
* create ```/AdGuardHome``` directory on your docker host.
* create container from docker image "ksey/adguardhome", connect host ```/AdGuardHome``` directory to the container directory ```/opt/AdGuardHome/config``` and start container.

Example:
```
docker pull ksey/adguardhome
docker run --name AdGuardHome -d -p 192.168.1.10:53:53/udp -p 192.168.1.10:53:53/tcp -p 3000:3000 -v /AdGuardHome:/opt/AdGuardHome/config --restart always ksey/adguardhome
```

* AdGuardHome DNS works on 192.168.1.10, port 53
* Open the browser and navigate to http://192.168.1.10:3000/ to control your AdGuardHome service. Default login and password - ```admin/admin```.
* Edit file ```/AdGuardHome/AdGuardHome.yaml``` (on the host) to change the password and other parameters.



2019-01-11 12:31:53: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.92-hotfix2:

🔧 Another hotfix has arrived! 🔧

It appears that v0.92 messed with the Netflix app (see #534 and #521), so we had to release one more hotfix. Hopefully, this one is the last and there will be no other problems with v0.92.

The only change is that AGH now additionally listens to TCP alongside with UDP: #521.
# #
