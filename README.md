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








































































































































# #
### AdguardTeam/AdGuardHome last release:
2019-04-23 18:18:34: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.95:

As we all know, AdGuard Home is almost perfect (haha... no 🙃), so we had no other option for this update than to go with quality of life improvements. 

Well, actually, we managed to scrape up *some* bugs for our devs to fix, so there are bugfixes if you are into them so much. Weirdo.

### 🧙‍♂️ Initial configuration wizard

* [Changed] It now checks for root access and solves some known issues automatically: #685 

![image](https://user-images.githubusercontent.com/5947035/56598361-0534fa00-65fd-11e9-8353-9a4df86a7529.png)

* [Fixed] Do not show 'port 443 is not available' error notification if encryption is not enabled: #700 
* [Fixed] 'All Interfaces' redirects Wizard to 0.0.0.0 instead of the proper IP: #655 

### 🌐 DHCP

* [Added] AdGuard Home now suggests setting static IP address when the user tries to enable DHCP: #686 

![image](https://user-images.githubusercontent.com/5947035/56598395-167e0680-65fd-11e9-9c62-692560ad6b33.png)

* [Fixed] "Enable DHCP server" is always inactive in some cases: #704 
* [Fixed] DHCP Lease Table - Mobile View Compatibility: #688 

### Minor improvements

* [Added] Enable gzip compression for static files in the admin interface: #626 
* [Added] --pidfile argument: #609 
* [Added] Enforce safe search on  🦆 DuckDuckGo: #603 
* [Added] Prepare and publish a Privacy policy for AG Home: #393 
* [Changed] Increase the default timeout used for downloading filters updates: #643 
* [Changed] Disable SSL 3.0 and TLS 1.0 and 1.1: #651 

### Fixed some annoying bugs

* [Fixed] Prompting to update to 0.94 when 0.94 is updated and running: #660 
* [Fixed] Chrome asks to translate English Web Interface from Portuguese: #656 
* [Fixed] Filter list names are not showing for some lists: #661 
* [Fixed] Missed translations on the settings screen: #652 
