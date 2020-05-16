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
2020-05-15 15:46:06: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.102.0:

Finally, it's time for the next AdGuard Home release! This time we brought you some really cool features, stay with me to learn what's that all about.

## Faster internet 🚄

Now that sounds cool! In reality, of course, that's a combination of features aimed at increasing your connection speed. They won't magically make your already fast Internet even faster, but will help immensely those who suffer from slower connection (for example, we heard such complaints from our Chinese users).

### Fastest IP address: #715

First of all, there's a new option called **Fastest IP address**. You can enable it in the DNS settings.

<img width="681" alt="up04_AdGuard Home_xosct" src="https://user-images.githubusercontent.com/5947035/82048151-c1f07200-96bc-11ea-961b-a3326cb50510.png">

You probably have a vague idea of what it does (**IT CHOOSES THE FASTEST IP ADDRESS** 😯), but how exactly does it work? Here's how:

1. AdGuard Home simultaneously sends your DNS query to all configured DNS servers. **Avoid using too many or too slow resolvers!**
2. It gets all IP addresses from all responses and checks which one is the fastest of all.
3. It keeps only the fastest one in the DNS response.

Overall, this would make DNS queries slightly slower, but since it chooses the fastest IP address, it may improve the internet speed. ⚖️

### Configurable min/max cache time-to-live: #1214 

You can now override the time-to-live values and use a larger one if necessary. This way you can reduce the overall number of DNS queries that are actually sent to remote DNS servers. 

At this moment it cannot be configured via the web interface. If you want to use it, you gotta get your hands dirty. 👷 Edit `AdGuardHome.yaml` to change `cache_ttl_min` or `cache_ttl_max`. You can learn more about the configuration file [here](https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration#configuration-file). 

Thanks a lot to @adworacz who basically implemented this feature. 🙏

### Upstream proxy settings for AdGuard Home: #458

You can configure AdGuard Home to use a proxy server for internal web requests (updating blocklists, for instance). In order to do this, set `http_proxy` in `AdGuardHome.yaml` (e.g. `http://user:password@server:port/`). Supports `http`, `https`, and `socks5` scheme.

## Other changes

### Added or improved

* Upgrade to Go v1.14: [#1540](https://github.com/AdguardTeam/AdGuardHome/issues/1540)
* Add the ability to resolve hostnames from /etc/hosts - like hosts files: [#1478](https://github.com/AdguardTeam/AdGuardHome/issues/1478)
* PTR/rDNS Support: [#1562](https://github.com/AdguardTeam/AdGuardHome/issues/1562)
* "Blocked domains" in the DNS access settings should accept wildcards: [#1469](https://github.com/AdguardTeam/AdGuardHome/issues/1469)
* Fix memory allocations on enabling/disabling large filter lists: [#1463](https://github.com/AdguardTeam/AdGuardHome/issues/1463)
* Non-standard path for certificates on Entware: [#1311](https://github.com/AdguardTeam/AdGuardHome/issues/1311)
* Receive specified signal just reload config/hosts not stop : [#1302](https://github.com/AdguardTeam/AdGuardHome/issues/1302)
* Add setting to remove client IP addresses from logs: [#916](https://github.com/AdguardTeam/AdGuardHome/issues/916)
* Add filters and hosts blocklists from local hard disk: [#817](https://github.com/AdguardTeam/AdGuardHome/issues/817)
* Add DNSSEC support: [#66](https://github.com/AdguardTeam/AdGuardHome/issues/66)
* Solve the issue with DNS cache pollution -- add bogus-nxdomain: [#1545](https://github.com/AdguardTeam/AdGuardHome/issues/1545)

### Fixed

* UI shows an alert about failed update even though the update was successful: [#1617](https://github.com/AdguardTeam/AdGuardHome/issues/1617)
* Data contains non-printable characters: [#1554](https://github.com/AdguardTeam/AdGuardHome/issues/1554)
* DNS upstream for a specific domain in Client config not working: [#1539](https://github.com/AdguardTeam/AdGuardHome/issues/1539)
* Remove dynamic lease from our lease index after a static lease is added: [#1531](https://github.com/AdguardTeam/AdGuardHome/issues/1531)
* Installation is blocked on OpenWRT: [#1516](https://github.com/AdguardTeam/AdGuardHome/issues/1516)
* Set the source IP address of DNS reply same as destionation IP of original request: [#1490](https://github.com/AdguardTeam/AdGuardHome/issues/1490)
* Plain text DOH & strict sni will be reset after save encryption config: [#1484](https://github.com/AdguardTeam/AdGuardHome/issues/1484)
* 'Client settings' do not allow using IPv6 CIDR: [#1479](https://github.com/AdguardTeam/AdGuardHome/issues/1479)
* DNS-TLS Vulnerability(s): [#1384](https://github.com/AdguardTeam/AdGuardHome/issues/1384)
* Upgrade through Dashboard fails if AGH service is run as non-root user: [#1193](https://github.com/AdguardTeam/AdGuardHome/issues/1193)

### Other

* Trim DNS blocklists url: [#1634](https://github.com/AdguardTeam/AdGuardHome/issues/1634)
* 'Blocked Services' settings reset: [#1624](https://github.com/AdguardTeam/AdGuardHome/issues/1624)
* Switch places for "Upstream DNS servers" and "DNS servers configuration": [#1619](https://github.com/AdguardTeam/AdGuardHome/issues/1619)
* Display more than 5 lines in "DNS rewrites": [#1578](https://github.com/AdguardTeam/AdGuardHome/issues/1578)
* Add icon for iOS shortcut: [#1574](https://github.com/AdguardTeam/AdGuardHome/issues/1574)
* Check the filtering feature doesn't clear results: [#1548](https://github.com/AdguardTeam/AdGuardHome/issues/1548)
* Don't skip point-to-point interfaces: [#1534](https://github.com/AdguardTeam/AdGuardHome/issues/1534)
* No link-local ipv6 interfaces in the "Setup guide" tab: [#1481](https://github.com/AdguardTeam/AdGuardHome/issues/1481)
* Assigning client tags from mobile is impossible: [#1471](https://github.com/AdguardTeam/AdGuardHome/issues/1471)
* Enabling or disabling a filter list should trigger a "loading" screen: [#1462](https://github.com/AdguardTeam/AdGuardHome/issues/1462)
* Add new languages: thai, romanian: [#1445](https://github.com/AdguardTeam/AdGuardHome/issues/1445)
* Add information about running DHCP server in docker: [#1434](https://github.com/AdguardTeam/AdGuardHome/issues/1434)
* Digit grouping ("thousands separator") for numbers on the dashboard: [#1423](https://github.com/AdguardTeam/AdGuardHome/issues/1423)
