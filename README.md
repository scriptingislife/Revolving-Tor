# Revolving Tor ![](https://travis-ci.com/becksteadn/Revolving-Tor.svg?branch=master)

A rotating proxy using Tor.

```
make build

make daemon

curl --proxy localhost:9060 http://httpbin.org/ip
```