#!/bin/ash

echo "[!] Starting TOR SOCKS proxy"
tor -f tor.conf

echo "[!] Starting Polipo HTTP proxy"
polipo -c polipo.conf

sh