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












































































































































































































































































































































































































2020-09-16 16:18:15: [AdguardTeam/AdGuardHome, RELEASE] AdGuard Home v0.104.0-beta1:

835f3b911b66902902f4231913913e8bafdde4e4 (origin/feature/update_locales, feature/update_locales) Added unused translations counter
380ce34ce642b2b36d400e90c68bc4980c119fe0 Update locales
2a5b0b8da1f85727e36a4601c51bdfb79ef2583f - client: Allow change minimum TTL override in UI
625f1dffe12e3f2f7671aa01a0bb5a30b152fbd2 * (dnsfilter): minor refactoring, comments
b3a68bb806dd16228398a64e66ef08b891cb3f30 * (global): added --no-mem-optimization flag
cb8afde629f272be79782b8e5bee4908ae97eabc * (dnsforward): fix reverse lookups from /etc/hosts
caee4b86fa4e4c5742427af34a80c8338b7dcd82 * (dnsforward): upgrade dnsproxy to v0.32.5
75d680ff30001e846edcbbc6c102fb36ce52bcba * (dnsforward): added some hosts to disallowed by default
88c67764b9515902514b0a8e4f00af29a353c584 (origin/1680-upstreams-file, 1680-upstreams-file) * (dnsforward): don't fail when default upstream is not set
0818d5149340ea63df9761caa7fd3fa29eef676d Merge: - client: Fix delay of custom filter editor
9a49161f15dd433201afd7f1f03e92fb7caf35d5 Merge: * DNS: use REFUSED DNS error code as the default blocking method
ccb903c9a04d20f40d36ea1d7509e8e2dd618c40 Merge: + DoQ client/server
abc08b75721eda43cb8a2b35d7ad28f108a503ea Merge: + client: Add experimental DNS-over-QUIC support
3c85b994d38f2dc6612b83e02fae10be57b16ee8 Merge: Dsheets service options
7be0cc72df9b01922e6bc5b3e6e9c6ab57b3fc26 (origin/dsheets-service-options, dsheets-service-options) Don't run home_test with race detection
b04e12e189b5949cdc8f60aede950dedf574d839 + client: Display upstreams list loaded from a file
c5ca2e60c6c94f0e00a710e692e8d9a6900371d1 - client: Count client requests correctly
366fdab60594e86e97a95d93dad8aa34c47940aa + client: Add REFUSED DNS error code as the default blocking method
06594bde8f70c5bbf04b03a3e1c9ad99539787e2 - client: Add link to 'update_failed' error toast
84938c560381d87257353165b0d974cb7826a137 - client: Fix whois cell styles
14bc5297ac6cb7c6dbc74d55239eeb16c041c048 + client: Add experimental DNS-over-QUIC support
12ed67ab1154138c0008f18b6fb7ac8a17f43860 (origin/feature/1914) + client: Add REFUSED DNS error code as the default blocking method
90ef204d0473c9df6bba468f33f2669a0bcf519f service: installation and running of AGH as a service with CLI args
9e87f0afed6f26605adb1661cdc32f5c07947c02 home/auth: disable non-crypto RNG gosec lint check for session salt
d3428ca46c9d68b4d9d6d1967fbe128b7799dac7 home/options: add options -> args serialization
03506df25d5c6af6daf1ba19300d2697ad241bda cli: factor options struct and parsing into home/options.go
15a82233f3dc8b5307e3edef2214f98ab408de64 - client: Fix whois cell styles
8dc010886867de62340d933df7edc31314234abc + client: Redesign query logs block/unblock buttons
fc43e2ac6f07547e27e847caf77feddb50d740aa Merge: - client: Fix superfluous character in de locale
1a6bd29462963b1c52e0be6bbf7529af73b70bf0 Merge: - client: Fix top clients alignment
340052090c187c74d5e94b9baf55450cabb5bac3 Merge: - client: Display service name for blocked services
d53e32259a3a1b5f55b3e1730339f1a0410eb1be + DNS: "port_dns_over_quic" setting
07b6cc24b77c2bc300278a518072bb66280173b0 * dnsproxy v0.32.0
dfab6597cd0d3f92381cb2240cdc4fe5195bd74c + DNS: "dns.upstream_dns_file" setting
b6193c32ceb814ad305017854ad4bb2115f7cfbf + DNS: new blocking mode: "refused"
f0ebec545e2c96060a13fb6bb30f17bc6326ef8c * locales: blocking_mode_default: NXDOMAIN -> REFUSED
8f017d2c0e25969bd86eafa4adbc184e41c61dc0 * DNS: use REFUSED DNS error code as the default blocking method
474306d46546097700d5c767c7283f33f63f53d7 (origin/fix/1657) - client: Fix delay of custom filter editor
b54ce85d3d5f39957d0a2c3625c04e4936c40d94 - client: Fix top clients alignment
9e33bd52599c2039603d99f93db461cc6a6a23f4 - client: Display service name for blocked services
4efc464e98098b8558cac654fecfb046c1013a9b - querylog: file rotation didn't work properly; fix entry searching algorithm
e56c746b608fe15e79ac75bbdd1c25e78594aecf - client: Do not redirect to login page from install and login pages
729f4b176680219d69e9993dcafeb3abc0264322 Merge: * install: don't show an error about static IP if an interface is not selected
67bf027616df85911dca3caeef9b3d40d9e964ea * install: don't show an error about static IP if an interface is not selected
7931e50673ce0251fb632cd62fefdfcadf002988 + DNS: add "ipset" configuration setting
6b61429572398147622debb95335157bc14e1cb9 + client: Query Logs Infinite Scroll
0a4781be97db61d75872c4288f004e215079ca61 * urlfilter v0.12.2
7d3a72e626893656503ebdaea0eea1f95f9f29b1 Fix NoCoin list source
c822297065908fd800352d8a44ea30a2bc4361c9 Merge: * Update URLs for default filters
98b6eb320f951fca5d3588cb037a6df741d8fecd - DNS: didn't process requests while updating filters
9c999f98fb9bb2294e8031d75f0396277dfe465b + dhcp custom options
06af130bb7c042d8a44720cc9423b3fc76deadee - DHCP: fix crash after adding static lease which replaces the dynamic one
719ef16b93e149d18558401aa87a7544b2b1cd31 * DHCP: don't replace the host name from static lease
cb6ca3b0c46eca65a56c71a1c9fc3c1ea7c6a104 - windows: install: fix crash due to empty DHCP server pointer
eb3999a261de41fb3a99917638ae476563b1028a * /control/dns_config: allow all valid bootstrap server notations
f8924f0785eaca6a79366de08af4cfbb4001bbad Merge: + dhcpv6 server; rewrite dhcpv4 server; changed API
888c9d571450ca1b934d94446b4eed462207a2d2 Get rid of extra toast when static IP is not set
1806816d9c1a655467e6ed3934beec96a6944d4a Fix DHCP check when there is no V6 interface
fcc34ca80bedd34f2dd170bebe15dd2d06174f5d Check interface before showing alert
1d35d73fc515923b7d001d99314ac7ee87afcd95 + client: Refactor DHCP settings
c9f58ce4a73e57f4d23db9e99315b5bfd982fb16 * upgrade yaml schema 6->7: DHCP settings
dd46cd5f36ae31dfb4f31dcb4dec65921510db17 * copy dhcpv4/nclient4 package with minor enhancement
e7bef3a4480ea0cd6d4d6d612ca3f0e3d737a222 * POST /control/dhcp/find_active_dhcp: add dhcpv6 server info
23752377b76895dbcd78f25ed6df58e1bbcae153 - dhcp: CheckIfOtherDHCPServersPresent: fix
6090400ea00f2ea4b97cac780ad54c271e466376 * GET /control/dhcp/interfaces: remove 'mtu'; add 'gateway_ip'
ec24d18f83a032446116428cb3fc2acb390b8bd2 * GET /control/dhcp/interfaces: split IPv4 and IPv6 addresses
a3317c08c495f28d1d8c2e3905d1cc968ecc15c5 + dhcpv6 server; rewrite dhcpv4 server; changed API
c3123473cfbcd53d0be3aecdf5f6fe97f7d61f5b * DNS: resolve host names from DHCP: improve
8d0c8ad4381cbf23e1e6653561f7f14a26544d34 + DNS: resolve host names to IP addresses leased by AGH DHCP server
0b539ced92a7fc1318dd7702de33a7d692c12fcc * : different version url for edge builds
9e09dffbc3509a3abcbb88f738f7a5264ea99675 - dns: limit the number of active goroutines for incoming requests processing
473d881871b570dfe18e9a8556f6e8c10fc7e98f Merge: - client: Fix DNS settings
2f8e34e73b75a18cba70ae81e455c9e979642f52 Pull request 734: + client: 1778 Add ip sort function, write unit tests
705a9d909dfb37bb759ca1525af4d3748444f5f4 * SB/PC: use 4-character hash in request
d3f5b40700c89f3b1d2fae4c21ff15abb78e5962 Merge: + Makefile: sign release binaries with gpg
57e43a66c320ed301e33e0b2c0d8027391cab542 Merge: - client: fix log filters and guide tab styles
4f3d503916fcc5637b1005ec3bc84a0212967093 Merge: - client: fix query log on edge legacy
6bb6c700d6fc519953fb1cbe8e3aba01637f40c1 Merge: - client: fix empty log error
ed76a3cb8b0704741a972263a41ee0eff345e655 Merge: - client: check touch events for tooltips
335d62b08eabc2ae0cedc3400ee95b2cfc1d4836 - "set_url": couldn't set a new path for filter local file
99625da1e44b4e6686f3c4b29526949ef471a100 - "set_url": couldn't set a new path for filter local file
9fecab8675b3496cb6fa5f03084e0be7c364a263 - client: fix log filters styles
b9aa969a56c94a9b121254729c781045d006e858 - client: fix guide tab styles
ce21514246dfc89f1178d9346769317f1fff4d05 - client: check touch events for tooltips
3ff0c964dc05c0b393b6b7140cf59bffb8f70806 - client: fix empty log error
552280e9a36a15c7c2347af75d97fe2943f80093 - client: fix query log not load on edge legacy
d154456ae52c349d5858bfc51dd293fe2bf3c1fe - client: tooltip show delay
a033b68bfdc9166a61000ee13f31b87933afa9c8 * Update blocked_services.go
cecf84836494a432c59157295c1aaf8663df1a42 * client: Corrects the provided homepage for "The Big List of Hacked Malware Web Sites"
