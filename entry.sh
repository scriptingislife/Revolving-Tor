#!/bin/sh

BASE_TOR_PORT=5000
BASE_CTRL_PORT=6000
BASE_POLP_PORT=4000
p=1

while [ $p -le 25 ]
do
    echo
    echo "[*] Starting Proxy $p"

    TOR_PORT=$(expr $BASE_TOR_PORT + $p)
    CTRL_PORT=$(expr $BASE_CTRL_PORT + $p)
    POLP_PORT=$(expr $BASE_POLP_PORT + $p)

    tor -f tor.conf --SocksPort $TOR_PORT --ControlPort $CTRL_PORT --PidFile /tordata/pid/tor$p.pid --DataDirectory /tordata/tor$p
    polipo -c polipo.conf proxyPort=$POLP_PORT socksParentProxy=127.0.0.1:$TOR_PORT

    p=$((p+1))
done

haproxy -f haproxy.conf
echo "[*] Done"

sh