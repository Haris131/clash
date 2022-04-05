**Table of Contents**

 - [Openclash](#openclash)
   - [Shadowsocks](#shadowsocks)
   - [Vmess](#vmess)
   - [Snell](#snell)
   - [Trojan](#trojan)

# Openclash Config

## Openclash

Plugin ini adalah klien Clash yang bisa dijalankan di termux. Kompatibel dengan Shadowsocks ShadowsocksR, Vmess, Trojan, Snell dan protokol lainnya, dan mengimplementasikan proxy kebijakan sesuai dengan konfigurasi aturan yang fleksibel.

#### Shadowsocks

* Shadowsocks Original / tanpa plugin
```yaml
- name: "shadowsocks"
  type: ss
  server: aaa.bbb.ccc.ddd
  port: 34963
  cipher: chacha20-ietf-poly1305
  password: passwordss
  udp: true
```
* Shadowsocks dengan plugin obfs
```yaml
- name: "shadowsocks obfs"
    type: ss
    server: aaa.bbb.ccc.ddd
    port: 32033
    cipher: chacha20-ietf-poly1305
    password: passwordss
    plugin: obfs
    plugin-opts:
      mode: tls
      host: BUG.COM
```

#### Vmess

* Vmess websocket dengan BUG SNI
```yaml
- name: "Vmess ws bug SNI"
  type: vmess
  server: aaa.bbb.ccc.ddd
  port: 443
  uuid: UUIDMU
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: BUGSNI.COM
  network: ws
  ws-opts:
    path: /com
    headers:
      Host: BUGSNI.COM
    max-early-data: 2048
    early-data-header-name: Sec-WebSocket-Protocol
```
* Vmess websocket dengan BUG CDN (bolak-balik)
```yaml
- name: "vmess ws bug CDN"
  type: vmess
  server: IPCDN/BUGCDN.COM
  port: 443
  uuid: UUIDMU
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: false
  servername: namadomainservermu.com
  network: ws
  ws-opts:
    path: /com
    headers:
      Host: namadomainservermu.com
    max-early-data: 2048
    early-data-header-name: Sec-WebSocket-Protocol
```
* Vmess gRPC bug SNI
```yaml
proxies:
  - name: vmess grpc SNI
    server: aaa.bbb.ccc.ddd
    port: 443
    type: vmess
    uuid: UUIDMU
    alterId: 0
    cipher: auto
    network: grpc
    tls: true
    servername: BUGSNI.COM
    skip-cert-verify: true
    grpc-opts:
      grpc-service-name: grpcpath
```
* Vmess gRPC bug CDN
```yaml
proxies:
  - name: vmess grpc CDN
    server: IPCDN/BUGCDN.COM
    port: 443
    type: vmess
    uuid: UUIDMU
    alterId: 0
    cipher: auto
    network: grpc
    tls: true
    servername: namadomainservermu.com
    skip-cert-verify: false
    grpc-opts:
      grpc-service-name: grpcpath
```

#### Snell

* Snell Server v3 (support udp).
```yaml
- name: "snell server"
  type: snell
  server: aaa.bbb.ccc.ddd
  port: 33223
  psk: password
  version: 3
  udp: true
  obfs-opts:
    mode: tls
    host: BUGSNI.COM
```

#### Trojan

* Trojan-gfw bug SNI
```yaml
- name: "trojan-gfw SNI"
  type: trojan
  server: aaa.bbb.ccc.ddd
  port: 443
  password: PASSWORD
  udp: true
  sni: BUGSNI.COM
  alpn:
    - h2
    - http/1.1
  skip-cert-verify: true
```
* Trojan-go websocket bug CDN
```yaml
- name: trojan ws cdn
  server: IPCDN/BUGCDN.COM
  port: 443
  type: trojan
  password: PASSWORD
  network: ws
  sni: namadomainservermu.com
  skip-cert-verify: false
  udp: true
  ws-opts:
    path: /trgo
    headers:
        Host: namadomainservermu.com
```
* Trojan gRPC bug SNI
```yaml
- name: "trojan gRPC SNI"
  type: trojan
  server: aaa.bbb.ccc.ddd
  port: 443
  password: PASSWORD
  udp: true
  sni: BUGSNI.COM
  alpn:
  - h2
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojangrpc
```
* Trojan gRPC bug CDN
```yaml
- name: "trojan gRPC CDN"
  type: trojan
  server: IPCDN/BUGCDN.COM
  port: 443
  password: PASSWORD
  udp: true
  sni: namadomainservermu.com
  alpn:
  - h2
  skip-cert-verify: false
  network: grpc
  grpc-opts:
    grpc-service-name: trojangrpc
```

