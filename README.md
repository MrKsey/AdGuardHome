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



























































































































2019-11-19 20:50:45: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.99.3:

Move along citizens, nothing to see here 👮‍♂️🤚

Well, except for a regular minor update with a few fixes and improvements.

* Fixed a bunch of query log search issues
* Fixed a couple of crashes
* Some minor improvements

Here's the full changelog:
https://github.com/AdguardTeam/AdGuardHome/milestone/20?closed=1
































# #
### AdguardTeam/AdGuardHome last release:
2020-03-13 12:45:18: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.101.0:

Due to the coronavirus 🦠, World Health Organization strongly recommends people to stay at homes. And just as much as means of physical protection are important to your personal health, cyber protection is crucial for the health of your home network. Under the circumstances, we decided it was high time 🕛 to release the next version of AdGuard Home 🏡 

And we have enough new toys to play with to keep you busy for a while!

## Filter lists

This update is all about filter lists. As you probably know, the blocking quality depends on the lists you use, and these lists are mostly maintained by a large community of volunteers 👥. Our job is to provide these people with a convenient framework, and that's what we're always striving to do.

### Client tags and `ctag` modifier support [#1081](https://github.com/AdguardTeam/AdGuardHome/issues/1081)

The `ctag` modifier allows blocking domains for specific types of DNS clients. You can assign tags to clients in AdGuardHome UI. Then, once it's done, you can create filtering rules that work for specific clients only.

For instance, here's my phone tagged as `device_phone`:

![image](https://user-images.githubusercontent.com/5947035/76601035-2a826d80-6519-11ea-8f58-f713d2dba75d.png)

The rule `||facebook.com^$ctag=device_phone` blocks `facebook.com` for clients tagged with `device_phone` only and won't do anything to other clients 🙅‍♂️

Currently, using `ctag` requires manual configuration which might be not bad, but it's not ideal for sure. In the future, we are going to assign some tags automatically by analyzing the behavior of each client. However, we [need your help](https://github.com/AdguardTeam/AdGuardHome/issues/1468) with that.

### A tool for testing domains against Filter rules [#856](https://github.com/AdguardTeam/AdGuardHome/issues/856)

Typing `nslookup` every time you need to test whether a domain is being blocked or not is rather tedious 😩 AdGuard Home now provides a simple tool to do that right from the web admin panel.

![image](https://user-images.githubusercontent.com/5947035/76602813-c5307b80-651c-11ea-9279-c3cf25795513.png)

### Support Whitelist Lists [#822](https://github.com/AdguardTeam/AdGuardHome/issues/822)

I am personally not a huge fan of this because modern adblock-style filter lists provide more flexible ways, but this feature is quite important to people that use humongous hosts blocklists and prefer to <s>shoot</s> 🔫 block first and ask questions later. We're not here to judge, so here it goes, add your own whitelists and have fun with them! 

## We are looking for filter lists

It is time to extend the number of filter lists available by default from the UI. If you have any suggestions, [please tell us](https://github.com/AdguardTeam/AdGuardHome/issues/1325)! We're all ears 🗣👂

Please note, that we will prioritize lists that use the [modern syntax](https://github.com/AdguardTeam/AdGuardHome/wiki/Hosts-Blocklists) compatible with AdGuard Home over simple /etc/-hosts-style lists.

### Host-lists compiler

We made a tool for filters maintainers that makes it easier to compile a new filter list compatible with AdGuard Home: https://github.com/AdguardTeam/HostlistCompiler

Here's what it can do:
* Validate filtering rules
* Remove some rules modifiers (which are more or less safe to remove)
* Transform and compress /etc/hosts lists

## Compatibility with OpenWRT

AdGuard Home is now compatible with OpenWRT. Not that it was completely incompatible before, you could always run a binary, or you could build it manually for (almost) any CPU.

The problem was that you could not install AdGuard Home as a service as per the [Getting Started](https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started) manual, and doing it manually requires some advanced technical knowledge 🎓

Anyways, this is not a problem anymore! AdGuard Home can be installed on an OpenWRT device and registered as a service: [#1348](https://github.com/AdguardTeam/AdGuardHome/issues/1348), [#1386](https://github.com/AdguardTeam/AdGuardHome/issues/1386) [#1239](https://github.com/AdguardTeam/AdGuardHome/issues/1239).

And if you want better integration with OpenWRT, there is an awesome luci application by @rufengsuixing:
https://github.com/rufengsuixing/luci-app-adguardhome/

## API changes

If you're using AdGuard Home API, please check out the list of [API changes](https://github.com/AdguardTeam/AdGuardHome/blob/master/openapi/CHANGELOG.md) that are not backward-compatible, or check [the log](https://github.com/AdguardTeam/AdGuardHome/commits/master/openapi) to see all changes.

## Other improvements and bugfixes

* Added a setting to block AAAA (ipv6) records: [#473](https://github.com/AdguardTeam/AdGuardHome/issues/473)
* Use relative URLs everywhere: [#1300](https://github.com/AdguardTeam/AdGuardHome/issues/1300)
* Added an add option `-V` to return the version of AdGuardHome installed: [#1285](https://github.com/AdguardTeam/AdGuardHome/issues/1285)
* Add "Required-Start: $network" to the sysv init script: [#1246](https://github.com/AdguardTeam/AdGuardHome/issues/1246)
* UI: "clients"-related improvements: [#1218](https://github.com/AdguardTeam/AdGuardHome/issues/1218)
* Query Log doesn't show date: [#1202](https://github.com/AdguardTeam/AdGuardHome/issues/1202)
* Mark blocked clients in the query log and "Top Clients" on the dashboard: [#1108](https://github.com/AdguardTeam/AdGuardHome/issues/1108)
* Suggest setting a static IP while doing initial setup: [#1069](https://github.com/AdguardTeam/AdGuardHome/issues/1069)
* An option to refuse to establish TLS connection if SNI not match: [#1014](https://github.com/AdguardTeam/AdGuardHome/issues/1014)
* Query Log screen enhancement - Show name of Filters list: [#993](https://github.com/AdguardTeam/AdGuardHome/issues/993)
* Modify added filters: [#971](https://github.com/AdguardTeam/AdGuardHome/issues/971)
* [Feature Request] Add button to block client in top clients from dashboard?: [#896](https://github.com/AdguardTeam/AdGuardHome/issues/896)
* If there's a DNS rewrite for a domain, don't query the upstream for other record types: [#1441](https://github.com/AdguardTeam/AdGuardHome/issues/1441)
* Query Log does no scan the backup file: [#1389](https://github.com/AdguardTeam/AdGuardHome/issues/1389)
* Client has not been added to Clients (runtime) but it is present in DHCP: [#1378](https://github.com/AdguardTeam/AdGuardHome/issues/1378)
* Custom filter rule for IPv6 does not work anymore: [#1365](https://github.com/AdguardTeam/AdGuardHome/issues/1365)
* Rewrites: Record TTL is 0: [#1353](https://github.com/AdguardTeam/AdGuardHome/issues/1353)
* Client Name Issue(UI Problem): [#1314](https://github.com/AdguardTeam/AdGuardHome/issues/1314)
* IPv6 server not work: [#1309](https://github.com/AdguardTeam/AdGuardHome/issues/1309)
* Cannot auto-upgrade when I run ADG with separated bin, work dir and config file,: [#1307](https://github.com/AdguardTeam/AdGuardHome/issues/1307)
* Requests count is empty for clients that have multiple identifiers: [#1294](https://github.com/AdguardTeam/AdGuardHome/issues/1294)
* Installation flow may be broken in the case if the DNS server fails to startup: [#1293](https://github.com/AdguardTeam/AdGuardHome/issues/1293)
* Blocking mode does not seem to work correctly (NX Domain): [#1284](https://github.com/AdguardTeam/AdGuardHome/issues/1284)
* The UI cannot handle the situation when the user has been logged out: [#1105](https://github.com/AdguardTeam/AdGuardHome/issues/1105)
* Safe search: Return IP address list: [#1342](https://github.com/AdguardTeam/AdGuardHome/issues/1342)
* Auto closing of menu sidebar after choosing: [#1318](https://github.com/AdguardTeam/AdGuardHome/issues/1318)
* Suggest to use detailed date format in filters' update time and log.: [#624](https://github.com/AdguardTeam/AdGuardHome/issues/624)
