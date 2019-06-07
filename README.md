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


























































































































































































2019-06-06 16:05:35: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.96:

Hi everyone, we are finally ready to please you with a new version of AdGuard Home! 🎉 

This seems to be the biggest update since AdGuard Home first appeared half a year ago, so prepare yourself for a long read. As of usual, I'll explain every major feature in detail. 

### Beta update channel: #773 

If you wanted to contribute to AdGuard Home development but didn't know how - there is an easy option for you now. Use the beta version and report any issues to us (and believe me, there will be 😉).

And for the toughest and bold, there is another option. This is true hardcore. Try using our Docker image from the `edge` branch which is synced with this repo's `master` branch. You'll be the first to receive all the good stuff we're baking! And the other end of it too... ☯️

[Here](https://github.com/AdguardTeam/AdGuardHome#contributing) you can learn more about these options.

### Built-in update: #428 

Updating AdGuard Home now is as easy as pie 🥧 Whenever a new version is available, AdGuard Home will indicate this in the UI. 

![image (13)](https://user-images.githubusercontent.com/5947035/59039128-e4f38e80-887c-11e9-9963-0edea0085941.png)

If you click on the "Update" button, AdGuard Home will automatically download the new version, install it, and restart itself. It barely even needs you now :)

> Please note that auto-update is disabled in the Docker image. You should use the standard Docker Hub procedure instead.

### User-friendly client name -- Using Reverse DNS lookup: #706 

Tired of seeing faceless IP addresses? 😶 Reverse DNS lookup to the rescue! AdGuard Home will try to resolve a human-readable name for every client IP. 

<img width="592" alt="up04_e0zdw_AdGuard_Home" src="https://user-images.githubusercontent.com/5947035/59037162-65b08b80-8879-11e9-8fa5-ef1a81ea0e7e.png">

Not human-readable enough? Not a problem! Name them as you wish in the "Client settings". What? Oh, yeah, no big deal, just a **completely new settings section**.

### Client settings: #727 

Yeah, you heard it right! Don't want your kids to read gross YouTube comments on their iPads? But also want to read them yourself for whatever reason? We are not judging you! ⚖️ Head to the Client settings and do as you wish. 

<img width="665" alt="up04_yjwhp_AdGuard_Home" src="https://user-images.githubusercontent.com/5947035/59037521-19b21680-887a-11e9-81d4-5536f83385f6.png">

### Add Access settings: #728 

You can now control who can use your AGH DNS server 🚦 This one might not seem important to happy people who use AdGuard Home on their home network. However, if you are running a public resolver on a VPS (as I do, for example), you must be familiar with the pain of those pesky hackers trying to use your resolver for their DNS amplification attacks 🤬 The usual course of action was to block them with `iptables` which is tedious and takes a lot of time. Especially for a person like me who, despite years of using them, cannot remember the simplest `iptables` commands.

<img width="706" alt="up04_jrs8c_AdGuard_Home" src="https://user-images.githubusercontent.com/5947035/59038940-84fce800-887c-11e9-8309-41d4e5fef480.png">

### Other improvements and bugfixes

* [Added] Static DHCP Lease Configuration: #687 
* [Added] Implement NULL blocking in addition to NXDOMAIN: #742 
* [Added] Add a link to the list of known DNS providers to Upstream DNS settings: #734 
* [Improved] Split settings page into several pages: #726 
* [Improved] Optimize memory usage of hosts filters: #714
* [Improved] Use `https` for web services connections: #646 
* [Fixed] API does not decode form parameters correctly: #785 
* [Fixed] Error processing blocklist: #786 
* [Fixed] 303 status code on getting favicon.ico: #766  
* [Fixed] We cannot handle hosts files records with an IPv6 address: #735 
* [Fixed] Installation wizard: UI doesn't show "port not available" error: #729 

### Big thanks to all the contributors!

1. Thanks to everyone who helped to translate AdGuard Home!
2. Thanks to @alexzeitgeist @javabean @frenck @adrianrudnik who open pull requests and contribute to the code!
3. Additionally, huge thanks to @frenck for making [python AdGuard Home API client](https://pypi.org/project/adguardhome/), and creating the [AGH integration for Home Assistant](https://twitter.com/Frenck/status/1135248662328762370)! Impressive job!
