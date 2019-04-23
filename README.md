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
















































2019-03-22 14:30:14: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.94:

Over the last weeks and even months, we've been receiving *(mostly)* very positive feedback. Unfortunately, our 🤖 developers are not exactly known for their prowess with words, but they for sure know their 0s and 1s. So they express their gratefulness towards the users the only way they were taught: through the product. And as a result of the hard work they've put in last month, we have this new version of AdGuard Home! 💃💃💃 Hope you'll like it too! Let's have a look at what's inside:

### User-friendly client name -- using hosts file: #637 

🙈 If you don't like seeing nameless IP addresses in the query log and AGH dashboard, you can now define some user-friendly client names for them. Learn how to do it from [our wiki](https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration#friendly-names).

![top-clients-names](https://user-images.githubusercontent.com/5947035/54820830-81ac8400-4cb1-11e9-9ade-eac9abc67f5d.png)

### Parallel DNS Resolution: #596 

👆👇 There is now a new option in AdGuard settings that allows you to enable "parallel" DNS resolution. If you enable it, AdGuard Home will send queries to all configured upstream servers simultaneously and return the reply from the server which answers first.

### Ability to set upstream DNS per domain/TLD: #445

👨‍💻 This improvement is for those running a private nameserver on their network to deal with intranet domains. AdGuard Home now provides dnsmasq-like syntax for configuring DNS servers for specific domains/TLDs. You can read the configuration instruction [here](https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration#upstreams-for-domains).

### Built-in DHCP server bugs

We fixed the most pressing issues of our built-in DHCP server, and we're quite close to stop calling it "experimental" 😉. Here is what is fixed in this release.

* [Fixed] DHCP - IP Address bug: #567
* [Fixed] DHCP - Duplicate IP Address assigned on more than one device: #539 
* [Fixed] DHCP server leases an IP that is already occupied: #584 

### Other improvements and bugfixes

* [Added] Binaries for MIPS, MIPSLE and Windows x86: #593 #589 
* [Added] Add "Bootstrap DNS resolver" setting to the "upstreams" settings section: #542 
* [Added] Start using GO 1.12 and enable TLS 1.3: #595 
* [Added] Add "Setup guide" menu item: #605 
* [Added] Bulgarian language: #612 
* [Improved] "Check for update" button should forcibly check updates and ignore last time updated value: #537 
* [Fixed] Unnecessary memory allocations when loading filters metadata: #604 
* [Fixed] Service restart is required after disabling a filter: #620 
* [Fixed] Filter update interval is too frequent: #644 
* [Fixed] Config yaml does not support symbol link: #610 
* [Fixed] Windows - Cannot specify absolute path in log_file: #606 
* [Fixed] favicon.ico is fetched from Adguard servers: #625 
* [Fixed] Windows: register service to work under "Local system" user: #598 
* [Fixed] Change the default MalwareDomainList filter URL from HTTP to HTTPS: #621 
* [Fixed] Empty domain gets to the "Top Queried" domains: #597 

### AdguardTeam/AdGuardHome last release:
2019-03-22 14:30:14: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.94:

Over the last weeks and even months, we've been receiving *(mostly)* very positive feedback. Unfortunately, our 🤖 developers are not exactly known for their prowess with words, but they for sure know their 0s and 1s. So they express their gratefulness towards the users the only way they were taught: through the product. And as a result of the hard work they've put in last month, we have this new version of AdGuard Home! 💃💃💃 Hope you'll like it too! Let's have a look at what's inside:

### User-friendly client name -- using hosts file: #637 

🙈 If you don't like seeing nameless IP addresses in the query log and AGH dashboard, you can now define some user-friendly client names for them. Learn how to do it from [our wiki](https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration#friendly-names).

![top-clients-names](https://user-images.githubusercontent.com/5947035/54820830-81ac8400-4cb1-11e9-9ade-eac9abc67f5d.png)

### Parallel DNS Resolution: #596 

👆👇 There is now a new option in AdGuard settings that allows you to enable "parallel" DNS resolution. If you enable it, AdGuard Home will send queries to all configured upstream servers simultaneously and return the reply from the server which answers first.

### Ability to set upstream DNS per domain/TLD: #445

👨‍💻 This improvement is for those running a private nameserver on their network to deal with intranet domains. AdGuard Home now provides dnsmasq-like syntax for configuring DNS servers for specific domains/TLDs. You can read the configuration instruction [here](https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration#upstreams-for-domains).

### Built-in DHCP server bugs

We fixed the most pressing issues of our built-in DHCP server, and we're quite close to stop calling it "experimental" 😉. Here is what is fixed in this release.

* [Fixed] DHCP - IP Address bug: #567
* [Fixed] DHCP - Duplicate IP Address assigned on more than one device: #539 
* [Fixed] DHCP server leases an IP that is already occupied: #584 

### Other improvements and bugfixes

* [Added] Binaries for MIPS, MIPSLE and Windows x86: #593 #589 
* [Added] Add "Bootstrap DNS resolver" setting to the "upstreams" settings section: #542 
* [Added] Start using GO 1.12 and enable TLS 1.3: #595 
* [Added] Add "Setup guide" menu item: #605 
* [Added] Bulgarian language: #612 
* [Improved] "Check for update" button should forcibly check updates and ignore last time updated value: #537 
* [Fixed] Unnecessary memory allocations when loading filters metadata: #604 
* [Fixed] Service restart is required after disabling a filter: #620 
* [Fixed] Filter update interval is too frequent: #644 
* [Fixed] Config yaml does not support symbol link: #610 
* [Fixed] Windows - Cannot specify absolute path in log_file: #606 
* [Fixed] favicon.ico is fetched from Adguard servers: #625 
* [Fixed] Windows: register service to work under "Local system" user: #598 
* [Fixed] Change the default MalwareDomainList filter URL from HTTP to HTTPS: #621 
* [Fixed] Empty domain gets to the "Top Queried" domains: #597 
