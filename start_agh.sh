#!/bin/sh

if [ ! -e /etc/AdGuardHome/AdGuardHome.yaml ]; then
  cp /AdGuardHome.yaml /etc/AdGuardHome/AdGuardHome.yaml
fi

chmod 666 /etc/AdGuardHome/AdGuardHome.yaml

/opt/AdGuardHome/AdGuardHome -c /etc/AdGuardHome/AdGuardHome.yaml
