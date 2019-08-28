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



2019-06-07 17:54:50: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.96-hotfix:

We have a good tradition 🎂 Whenever a new version of AdGuard Home gets released, it is required to wait one day and then release a hotfix. Because having bugs in AGH releases is a tradition, too. Hm, now that I think of it, it's not that good of a tradition 🤔 In fact, I don't like it at all! 😡 And you can help us get rid of it forever, now that [Beta update channel](https://github.com/AdguardTeam/AdGuardHome#contributing) is available 🎉  

Let me now get serious for a minute and describe what was fixed in this update:

* [Fixed] An issue with forcing parental control for specific clients: [#727#issuecomment-499593806](https://github.com/AdguardTeam/AdGuardHome/issues/727#issuecomment-499593806)
* [Fixed] Bootstrapping DOH and DOT uses system resolver on Windows: #770 
* [Fixed] Wrong URL in the certificate expiration alert: #806 

P.S. One a bright side, if you are using v0.96, you can now check out how the built-in update works. Please note that the update check is performed once in 8 hours.














2019-08-22 13:14:12: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.98.1:

A quick hotfix for a release is like a cherry on top of a tasty cake. And it turns out we are darn good cooks! 👨‍🍳 

After this hotfix, the "Blocked services" settings won't reset every time you restart AG Home. You know, like they should have done in the first place. Bon appetit! 👌 
# #
### AdguardTeam/AdGuardHome last release:
2019-08-22 13:14:12: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.98.1:

A quick hotfix for a release is like a cherry on top of a tasty cake. And it turns out we are darn good cooks! 👨‍🍳 

After this hotfix, the "Blocked services" settings won't reset every time you restart AG Home. You know, like they should have done in the first place. Bon appetit! 👌 
