### Unofficial Docker Image for AdGuardHome
This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.

Official Docker Image for AdGuardHome here - https://hub.docker.com/r/adguard/adguardhome

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
































































































### AdguardTeam/AdGuardHome last release:
2019-10-24 12:56:41: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.99.1:

This hotfix is so hot, Scoville scale doesn't go high enough 🌶

A bunch of leftover bugs after the v0.99 release have been fixed here.

* [Changed] Enable DNS response compression: #1109 
* [Fixed] Sign out button is shown even when not using AdGuard Home Authentication: #1093 
* [Fixed] Unnecessary error alert: "New app version check is disabled by user": #1083 
* [Fixed] Cannot update filters on Windows: #1088 
* [Fixed] AGH does not resolve whois/rDNS info for non-A and non-AAAA queries: #1103 
* [Fixed] Do not print the certificate and key contents to the log even when the verbose level is enabled: #1107 
* [Fixed] Language issue: it looks as if "English" is selected even though the interface is in a different language: #1082 
* [Fixed] Cannot write query log to file: #1115
* [Fixed] Error reconfiguring DNS server on Windows due to delayed UDP socket unbinding: #1098 
* [Fixed] Incorrect content type headers on API responses: #1086 
