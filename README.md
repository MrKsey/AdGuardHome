### Unofficial Docker Image for AdGuardHome
This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.

# Official Docker Image for AdGuardHome here - https://hub.docker.com/r/adguard/adguardhome

AdGuard Home is a network-wide software for blocking ads & tracking. After you set it up, it'll cover ALL your home devices, and you don't need any client-side software for that.

![AdGuardHome](https://raw.githubusercontent.com/MrKsey/AdGuardHome/master/adh.PNG)

More info:
- https://github.com/AdguardTeam/AdGuardHome

### Requirements

* host with docker
* ~128 Mb RAM, ~100 Mb disk space 

## Usage

* docker host ip (for example) - 192.168.1.10 .
* create ```/AdGuardHome``` directory on your docker host for configuration files, filters and data.
* create container from docker image "ksey/adguardhome", connect host ```/AdGuardHome``` directory to the container directory ```/opt/AdGuardHome/data``` and start container.

Example:
```
docker pull ksey/adguardhome
docker run --name AdGuardHome -d -p 192.168.1.10:53:53/udp -p 192.168.1.10:53:53/tcp -p 3000:3000 -v /AdGuardHome:/opt/AdGuardHome/data --restart always ksey/adguardhome
```

* Open the browser and navigate to http://192.168.1.10:3000/ to control your AdGuardHome service.
* When you run AdGuard Home for the first time, there is a simple configuration wizard.
* Remember to set "Admin Web Interface" port to 3000.
* AdGuardHome DNS works on 192.168.1.10, default port 53.
* Edit file ```/AdGuardHome/AdGuardHome.yaml``` (on the host) to change the password and other parameters.


# #
### AdguardTeam/AdGuardHome last release:
2019-02-25 16:39:32: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.93:

🚆 Choo-choo dear AdGuard Home users, a huge update is on the way! 🚆

As usual, it took us more time than we anticipated, and only now we have finally decided that the features we have implemented by this moment are enough to call it a new version. By now you might've realized that we prefer major updates to minor bugfix releases.

So, what's inside?

## HTTPS, DNS-over-HTTPS and DNS-over-TLS support out-of-the-box: #285 

I can't stress enough how cool it is. DOH and DOT are both relatively new DNS encryption protocols, and there is not much software supporting them. But they have great potential, and we at AdGuard like to be at the cutting edge of technology, so here we are.

"Ok, so what's so cool about it? 😕" you might ask. Well, even a kid can now manage to set up a secure DNS server. And if you are an Android 9 user, you can configure it to use your DNS-over-TLS server without any additional software needed. On iOS, you'll need to use additional software, but there is a hope that Apple will soon follow the trend and add native DNS-over-TLS support.

Here is a guide on how to configure your AdGuard Home to be a secure DNS server: https://github.com/AdguardTeam/AdGuardHome/wiki/Encryption

## Official Docker image: #562 

You asked for it, and we are happy to deliver. Finally, there is an official AdGuard Home image on [Docker Hub](https://hub.docker.com/r/adguard/adguardhome). New builds will be uploaded there automatically.

Important tags:

* `latest` — 👴 always the latest **stable** build of AdGuard Home.
* `edge` — 🔥 this one is for those who like to be on the bleeding edge. Always the latest build from this repository's **master** branch. <s>Might</s>Will be unstable.

## Simple daemon/service registration: #490 

Surprisingly, a lot of people were struggling with properly registering AdGuard Home as a service. Now it's as easy as this: `sudo ./AdGuardHome -s install`. That's it, done. More on this in our newly written [Getting Started](https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started) guide.

## First-time installation wizard

Another quality-of-life improvement. When you run AdGuard Home for the first time, there is now a simple configuration wizard.

![](https://user-images.githubusercontent.com/5947035/53299867-25407b00-3851-11e9-96fc-44d9a10813db.png)

## Other changes

* [Changed] Extend the verbose logging: #531 
* [Changed] Allow DNS server to bind address other than `0.0.0.0`: #550 
* [Fixed] Only allow single click on buttons: #544 
* [Fixed] A couple of localization issues: #540, #536 
* [Fixed] DNSCrypt upstream does not retry over TCP when it gets a truncated response: #524 
