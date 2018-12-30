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























### AdguardTeam/AdGuardHome last release:
2018-11-27 10:18:14: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.91:

📦The first serious update of AdGuard Home is ready! 📦

Initially, we wanted to include the built-in DHCP and web setup into this version, but it has been a while since we published new versions of AdGuard Home and we couldn't wait any longer. And even without those features we still have quite a lot new stuff to offer.

So what's new?

### Localization

One of the key steps in making AdGuard Home what we want it to be is to make sure anyone can use it. Of course, it's essential for that purpose that AdGuard Home supports localizations. And now it does: #442.

Right out of the gates, this release brings the support of the following languages:

* Spanish
* French
* Japanese
* Portuguese
* Russian
* Swedish
* Vietnamese

There's more languages to come, of course. If you want to help with AdGuard Home translations, please learn more about translating AdGuard products here: https://kb.adguard.com/en/general/adguard-translations

Here is a direct link to the AdGuard Home project: http://translate.adguard.com/collaboration/project?id=153384

### Improved encrypted DNS support

We stated it many times, users' privacy and security are some of our highest priorities. The following changes (albeit to a different extent :)) follow this fundamental principle:

* AdGuard Home now supports DNS-over-HTTPS upstream: #451
* We fixed an annoying bug that prevented using hostnames when configuring a DNS-over-TLS upstream: #414
* We added some examples to the upstream settings for better understanding: #453

### Mitigating [DNS amplification](https://www.cloudflare.com/learning/ddos/dns-amplification-ddos-attack/) attacks

This one is a quite pressing issue actually, and those users who set up an AdGuard Home instance on a VPS are suffering from it. Unfortunately, there's no silver bullet and if you operate a public DNS server, malicious actors will eventually discover it and try to exploit. The only thing we can do is mitigate it and make it infeasible for them to use AdGuard Home instances for DNS amplification attacks: #426.

* Rate-limiting is now enabled by default
* By default, AdGuard Home refuses all `ANY` requests (which are often used for DNS amplification attacks)

The default rate-limit values are `20rps` and `20kbps` per client IP, but you can configure different values manually in `AdGuardHome.yaml`.

### Other bugfixes and improvements

* [Improvement] Family Filter: Force restricted mode on Youtube: #265
* [Improvement] Show which filter does the rule belongs to in the query log: #371
* [Fixed] Reboot of Raspberry PI Breaks Ad-blocking: #421
* [Fixed] Incorrect path to the configuration file if the "-c" parameter is used: #424
* [Fixed] Exception rule from the SDN filter does not work: #460
* [Fixed] @@ rules won't unblock domains blocked by a hosts file: #383
* [Fixed] Multiple mouse-over tooltips over-lapping: #439
* [Fixed] Sort by IP address doesn't properly sort by last octet : #437
* [Fixed] Corruption on bottom border of graphs with Edge browser : #433

### Acknowledgments

Huge thanks to everybody who volunteered and contributed to this release:

* @hoang-rio (authored most of the localization code!)
* @mustakimali
* @ajruckman

### Stay tuned

There's much more coming soon!
