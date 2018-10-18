#!/bin/bash

if [ ! -e /opt/AdGuardHome/config/AdGuardHome.yaml ]; then
  cp /AdGuardHome.yaml /opt/AdGuardHome/config/AdGuardHome.yaml
fi

chmod 600 /opt/AdGuardHome/config/AdGuardHome.yaml

/opt/AdGuardHome/AdGuardHome -c /config/AdGuardHome.yaml
