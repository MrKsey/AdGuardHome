#
# This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.
#

FROM debian:stable-slim
MAINTAINER Bob <kcey@mail.ru>

ENV URL=https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest
ENV OS="linux"

RUN export DEBIAN_FRONTEND=noninteractive \
&& apt-get update && apt-get upgrade -y \
&& apt-get install --no-install-recommends -y ca-certificates wget curl \
&& mkdir /etc/AdGuardHome && chmod 644 /etc/AdGuardHome && cd /opt \
&& wget --tries=3 $(curl -s $URL | grep browser_download_url | egrep -o 'http.+\.\w+' | grep -i "$(dpkg --print-architecture)" | grep -m 1 -i "$(echo $OS)") \
&& tar -xvzf *.tar.gz \
&& rm *.tar.gz \
&& apt-get purge -y -q --auto-remove ca-certificates wget curl \
&& apt-get clean \
&& cd / \
&& rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

COPY AdGuardHome.yaml /etc/AdGuardHome/AdGuardHome.yaml

VOLUME [ "/etc/AdGuardHome" ]

EXPOSE 1053 3000

ENTRYPOINT ["/opt/AdGuardHome/AdGuardHome"]

CMD ["-c", "AdGuardHome.yaml"]
