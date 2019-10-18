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
2019-10-18 14:42:36: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.99.0:

It took us a while to publish a new release of AdGuard Home... 😴

The good news is, it may take you even longer to read through the changelog, that's how many improvements there are in this update! So we'd better kick things off asap.

## Login page

Do you know the two most important pieces of advice for dating? 🤔

1. Be attractive.
2. Don't be unattractive.

Turns out, they are applicable to software development as well! Finally, we have a beautiful login page instead of the ugly standard browser authentication window. HTTP basic auth is still around and will be useful for those who are using our API (yes, we have an [API](https://github.com/AdguardTeam/AdGuardHome/tree/master/openapi)! Didn't you know?).

![image](https://user-images.githubusercontent.com/5947035/67085584-bf21b300-f1a7-11e9-885c-6118f8155de5.png)

## Whois data for the DNS clients

There's never too much data. You can now see more information about your DNS server clients. AdGuard Home gets country and the organization name from the whois data on the client IP.

> Please note that this feature makes sense only for those who run AdGuard Home on [a VPS](https://github.com/AdguardTeam/AdGuardHome/wiki/VPS).

![image](https://user-images.githubusercontent.com/5947035/67086342-2db34080-f1a9-11e9-9903-5cd91eef9cc5.png)

## Canary domain for Firefox: #988 

Mozilla is going to make a questionable move and enable Cloudflare DNS for all Firefox 🦊 users from the US by default. We're not saying Cloudflare DNS is bad, but it's obvious to us that people should be able to choose what they want when it comes to DNS providers. Fortunately, there's an option to opt-out by blocking a special "canary" domain, and that's what AdGuard Home does.

## Rework of the statistics screen and the query log: #415 #776

AdGuard Home had always been storing statistics and the query log just for the last 24 hours. It had been due to some implementation peculiarities, and certainly not because we were too lazy to undertake such a serious rework, no-no. 🙅 Long story short, it's much different now. See:

You can not only choose the query logs retention period in the settings; it's now possible to disable or clear it right from there.

![image](https://user-images.githubusercontent.com/5947035/67087033-c7c7b880-f1aa-11e9-8ffc-96caaaea3dd5.png)

You can also change the statistics retention period or clear statistics separately.

![image](https://user-images.githubusercontent.com/5947035/67087370-79ff8000-f1ab-11e9-8099-3acb881c9ec2.png)

Also, we conducted small research, and it clearly tells that the most interesting events usually lie between requests 5001-10000. So the query log is no more limited to the last 5000 records! 

![image](https://user-images.githubusercontent.com/5947035/67087464-a87d5b00-f1ab-11e9-9561-ecc4becda83c.png)

## Using the certificate & private key from a file instead of copy/pasting it: #634 

You too are tired of replacing the 'c' and 'v' letters on your keyboard due to the amount of copy/pasting it takes every time when the certificate is renewed? 🤬 Not any longer, simply specify the path to the cert & the private key once and forget about it.

![image](https://user-images.githubusercontent.com/5947035/67087903-9223cf00-f1ac-11e9-939d-42629f15a3c4.png)

## New translations: #1043

Now, huge thanks to everyone who's been helping us translate AdGuard! You people seriously rock! 🤟

Thanks to your efforts, today we're adding the following languages:

* Czech 
* Danish
* German
* Indonesian
* Korean
* Italian
* Polish
* Slovak
* Portuguese (pt-BR)
* Dutch
* Slovenian
* Turkish

## Notable bugfixes and improvements

* [Added] Encrypt/hash password in config: #394 
* [Added] Option to set time span when filter lists must be checked for updates: #641 
* [Added] Add response information to the "filtered" query log items: #912 
* [Added] Allow configuring DNS cache size: #947 
* [Added] Add TikTok and Epic Games to Blocked services: #950 #1010 (thanks to @onedr0p for the contribution!)
* [Added] Add option to instantly expire a DHCP lease: #833 
* [Changed] Change the way AdGuard Home registers a system service: #1048
* [Fixed] DNS cannot function during Filter update: #928 
* [Fixed] Using DoH upstream causes DNS timeout on WAN failover: #875 
* [Fixed] Static DHCP lease disappears after the device connects: #1016 
* [Fixed] DHCP static lease is not applied when the client reconnects: #1015 
* [Fixed] No answer in AAAA log if set to DNS redirects: #989 
* [Fixed] DHCP leases need to be added to the "Clients (runtime)" list: #979 
* [Fixed] DHCP Range check: #848 
* [Fixed] First-time run wizard won't work on `[::]`: #953 

## API: BREAKING CHANGES

There are some incompatible changes in the API in this version. Please read the changelog to learn more:
https://github.com/AdguardTeam/AdGuardHome/blob/master/openapi/CHANGELOG.md
