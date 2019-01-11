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
docker run --name AdGuardHome -d -p 192.168.1.10:53:53/udp -p 3000:3000 -v /AdGuardHome:/opt/AdGuardHome/config ksey/adguardhome
```

* AdGuardHome DNS works on 192.168.1.10, port 53
* Open the browser and navigate to http://192.168.1.10:3000/ to control your AdGuardHome service. Default login and password - ```admin/admin```.
* Edit file ```/AdGuardHome/AdGuardHome.yaml``` (on the host) to change the password and other parameters.



2019-01-04 19:23:05: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.92-hotfix1:

🔧 An urgent hotfix is on the way! 🔧

As it often happens with significant updates (at least in our case 😭), v0.92 is followed by a hotfix patching unexpected bugs here and there.

Here is a list of issues resolved in this update.

* [Fixed] Cloudflare DOH upstream misbehaves for some users: #520 
* [Fixed] v0.92 - sporadic DNS error: #505 
* [Fixed] Crash on a DNS request with invalid number of questions: #518 
* [Fixed] Cannot remove filters - Error: no such file or directory | 500: #502 
* [Fixed] Fix the travis build on OS X: #519 
* [Changed] Updated translations and added Chinese Traditional: #510 

