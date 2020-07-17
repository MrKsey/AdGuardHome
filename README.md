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















































































































































































































2020-07-13 11:12:50: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.103.0-beta1:

Now we will be publishing short release notes for every beta version that's being published.

a33164bf (tag: v0.103.0-beta1, github/master) Merge CI revamped and other enhancements
c2642cc5 (origin/feature-ci-revamp, feature-ci-revamp) fix GH actions snapshot build
6811d620 Removed snapshot target
1fe568b8 Updated links to beta&edge versions in README
f6217e60 Excluded some paths from golang linter
fdf60890 Fix version check when req body is empty
ab401cab Don't set the version tag for edge channel
0be02991 don't fail on packr
dc5c8979 fix packr detect
db028309 Improve makefile clean target
2bbffffc Fix project name, update README
632a47d5 (github/feature-ci-revamp) CI revamp part 2 (#1875)
ff23d7b6 CI Revamp by @crazy-max (#1873)
304a51f1 *(home): added anti-AD regional filter list
5d08e08a (ZusorCode-patch-1) Merge branch 'patch-1' of git://github.com/ZusorCode/AdGuardHome into ZusorCode-patch-1
49646cf7 + client: Add choosing filter lists Fix #1325
36f3218b - client: Fix mobile query log Fix #1828
036ab412 - client: Fix mobile query log
4f8138bd Fix #1764 + rewrites: support IP exception; support "pass A only" case
73c5d9ea - client: Improve DNS Rewrites Close #1764
32610840 (origin/1764-merge) Merge 1764 Improve DNS Rewrites
2f76f5d0 Merge: Fix #1587 UI + dns: new settings for cache
7dd3d944 Merge branch 'master' into 1587-cache-settings
48f40d5f Merge: fix #1587 + dns: new settings for cache
4303b3dd + dns: new settings for cache
dab0a9d8 + "--glinet" command-line argument: Run in GL-Inet compatibility mode Close #1853
6b134469 - client: Clear input field when switching from logs page Close #1523
0c4905fa Extract validation functions in the separate file
5980db1a + rewrites: support IP exception; support "pass A only" case
c12309a1 (origin/1587-cache-settings) Resolve conflict
2d5287fc Add DNS cache setting UI
21dfb5ff (origin/779-merge, github/779-merge) * querylog: case-insensitive search by domain name Close #1828
9df7aba9 - client: Fix client tracker source links Close #1813
9640752d - client: Don't normalise disallowed domains Close #1820
f5a1f311 - client: Display DomainCell popover Close #1817
205680b7 - client: Make language tag in HTML same as setting language Close #1797
72ce5f57 - auth: show detailed error message if Bolt couldn't initialize its DB Close #1846
250b254c - home: when printing HTTP addresses to console, use all IP addresses Close #1856
da6cd575 rollback dns
25a14e98 add dns to docker run
da546790 Fix #1433
4b2c33d1 Update translations
e38a1a58 * use dnsproxy v0.29.1 Close #1777
7a77dada Merge: * SB/PC: limit the number of hashes in request to 4 Close #1697
4f295d41 Merge: - client: Query logs fix
7d934571 Merge : *(home): do not require root privileges on the first run
7b2cc51e (origin/fix-1699, fix-1699) fix function comment
b43223d3 *(home): do not require root privileges on the first run
6693de9e Merge: + pass client Name and IP to dnsfilter
890876cb (origin/1761-client) + pass client Name and IP to dnsfilter
0ee3505e (origin/1697-sb) * SB/PC: limit the number of hashes in request to 4
49a92605 + dns: respond to PTR requests for internal IP addresses from DHCP Close #1682
caf78ae3 (origin/fix/1810) Merge with master
679b79a8 minor
2c47053c - autohosts: fix crash on startup if filesystem watcher couldn't be initialized Close #1814
aa7b3c33 Fix #1810 - client: Fix query log bugs
15db9e9c Open tooltip on hover, show scroll on overflow y
19c01337 Replace tooltip component
7e7103dc -client: Fix query log bugs
ec6e0bea * openapi: describe top_* array entries in /stats
523aeb5c fix log table width
e39fe1b9 Merge: fix #1421 Full rework of the query log
b1c951fb Merge: + new query logs API
4870da7f * auto-hosts: support '#' comments after ip and hosts Close #1807
a5c0381c + dns: new settings for cache
ec6ca93a * dns: disable cache with "cache_size: 0" setting Close #1591
59c4a288 (origin/1421-new-qlog-v2) openapi
bbc4eda3 If there are no more older entries, `"oldest":""` is returned.
15e71435 fix search by "whitelisted", "rewritten"
b6052a4c doc
5a93c1fb Merge branch 'gumadozucia-master'
973c609a (gumadozucia-master) Update README.md
6a0194c7 fix whois test
d1472afb - client: Refactor Setup guide component: Merge pull request #633 in DNS/adguard-home from fix/1740 to master Close #1740
1356ac26 - clients: fix incorrect info for clients from /etc/hosts Close #1786
cf087fb8 - service: "stop" didn't work correctly Close #1785
a79dda55 - client: Add default mode in the DNS settings: Merge pull request #650 in DNS/adguard-home from fix/1770 to master Close #1770
a869ec4c * DNS API: new setting "upstream_mode"; remove "fastest_addr", "parallel_requests"
dae275e6 * log: set default LogMaxAge = 3 days
c842a68a - client: Fix beyond 24 hour time format for en locale: Merge pull request #651 in DNS/adguard-home from fix/1766 to master Close #1766
4a81abb9 + client: Move "Blocked services" to a separate page under "Filters" menu: Merge pull request #649 in DNS/adguard-home from feature/1744 to master Close #1744
5ce98bd2 Merge: + config: add new logging settings Close #1763
539ccb2b Merge: + querylog,stats: anonymize client ip: /16 Close #1741
1b5fb97a + querylog,stats: anonymize client ip: /16
0d343abe * minor
e23b79dd + config: Added in lumberjack to handle rolling logs. Added more config properties around new log feature.
2ecd3854 - client: Hide version on inintial setup and login: Merge pull request #642 in DNS/adguard-home from fix/1748 to master
eac1b809 Merge: * blocked-services: Added 2 entries for YouTube and Amazon AWS Close #1758
9a030aa9 - rewrites: fix invalid question in response #1746
bb016f07 * blocked-services: Added 2 entries for YouTube and Amazon AWS
67dacdf8 - client: Fix safari icon: Merge pull request #640 in DNS/adguard-home from fix/1751 to master Close #1751
262bcd84 - client: Fix safari icon
620f5c22 - client: fix/1754 - Merge pull request #639 in DNS/adguard-home from fix/1754 to master Close #1754
b8032801 - client: Submit setFiltersConfig action on if the values are changed: Merge pull request #637 in DNS/adguard-home from fix/1749 to master Close #1749
dddcbe77 -client: Fix "DNS rewrites" adding an item error
72f253f6 - client: Match client IP strictly: Merge pull request #620 in DNS/adguard-home from fix/1687 to master Close #1687
bccb9393 + "dot"
78648649 openapi
d971bb99 * minor
0904eeff + client_proto
83b9b701 - client: Don't unregister field 'Upstream DNS servers' on rerender and allow input text continuously Close #1752
0adbce5d * openapi
0500aa95 + new query logs API
32d1f385 + config: new setting "querylog_file_enabled" Close #876
391e6199 * whois: use the upstream server to resolve whois server hostname Close #1535
5c2ca690 Merge: * web: log error messages from HTTP server as "debug" Close #1167
355e634f - client: Don't hide version string when built-in auto-update is disabled: Merge pull request #628 in DNS/adguard-home from fix/1726 to master Close #1726
ee690e3e * web: log error messages from HTTP server as "debug"
16a6aada Merge: *(querylog): added offset/limit parameters
605d2ae4 Merge: * urlfilter v0.10.1 Close #1707
1d75b2a5 Merge: + rewrites: support exceptions Close #1547
ab6be698 * urlfilter v0.10.1
8c5a3c55 Merge: * clients: set reload ARP data interval to 10 minuntes Close #1398
2825691c * clients: set reload ARP data interval to 10 minuntes
61a24ffc (origin/feature-1559, feature-1559) *(querylog): decode methods to a new file
ceedc2d1 *(querylog): added offset/limit parameters
118b1702 + rewrites: support exceptions:
383507bc + client: Allow `Fastest IP address` and `Parallel requests` to toggle each other: Merge pull request #619 in DNS/adguard-home from feature/1678 to master Close #1678
2f5073b7 Merge: - filter: don't reset name on update
2303bb25 - filter: don't reset name on update
2a2b7c6e Merge: * blocked-services: Update new TikTok domains #1725
b0501655 - blocked-services: fix build
31fff2ab * blocked-services: Update new TikTok domains
6f3cd4e7 + client: Update packages - Merge pull request #613 in DNS/adguard-home from fix/1597 to master Close #1597
8b25a488 Merge: * client: update guide
8d91e042 Merge:- rewrites: fix crash when handling name->cname->A chain
53277ee7 update guide
0848ca0e - rewrites: fix crash when handling name->cname->A chain
b5e78c76 (TXC-master) *(documentation): removed unnecessary dependencies
653d6871 Merge branch 'master' of git://github.com/TXC/AdGuardHome into TXC-master
2d1cba67 Merge: - filter: fix rules count when data doesn't end with a newline Close #1694
806f81ed Merge: - autohosts: support tab character Close #1686
2f454117 - autohosts: support tab character
286eb43c - filter: fix rules count when data doesn't end with a newline
2fca419c *(home): fix TLS module initialization
6adf48c9 *(home): added more logging to TLS module

### How to install AdGuard Home

* [Getting Started guide](https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started)
* [Unstable versions (beta and edge)](https://github.com/AdguardTeam/AdGuardHome#test-unstable-versions)
