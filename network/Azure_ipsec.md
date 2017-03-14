# Cisco
# "Azure IPsec configuration"

|Azure virtual network gateway| Value|
|-----------------------------|------|
|name|hogehoge01VNG|
|gateway|vpn|
|virutalnetwork|hogehoge01|
|gateway subnet|192.168.0.0/24|
|Azure network|172.16.0.0/16|
|public IP|1.1.1.1|
|local-address|2.2.2.2|
|SKU|basic|

```

crypto keyring keyring-hogehoge01VNG
  local-address 2.2.2.2
  pre-shared-key address 1.1.1.1 key 6 asdfadfadfsafasdfasdf

crypto isakmp policy 100
  encr aes 256
  authentication pre-share
  group 2
  lifetime 28800
  
crypto isakmp keepalive 10 10

crypto isakmp profile isakmp-hogehoge01VNG
   keyring keyring-hogehoge01VNG
   match identity address 1.1.1.1 255.255.255.255
   local-address 2.2.2.2
 
crypto ipsec transform-set ipsec-trans-hogehoge01VNG esp-aes 256 esp-sha-hmac
   mode tunnel

crypto ipsec df-bit clear

crypto ipsec profile ipsec-prof-hogehoge01VNG
 set security-association lifetime kilobytes 102400000
 set transform-set ipsec-trans-hogehoge01VNG
 
interface Tunnel1
 ip unnumbered Dialer1
 ip virtual-reassembly in
 ip tcp adjust-mss 1350
 tunnel source 2.2.2.2
 tunnel mode ipsec ipv4
 tunnel destination 1.1.1.1
 tunnel protection ipsec profile ipsec-prof-hogehoge01VNG isakmp-profile isakmp-hogehoge01VNG

interface Dialer1
 mtu 1454
 ip address negotiated
 encapsulation ppp
 ip tcp adjust-mss 1414
 dialer pool 1
 dialer idle-timeout 0
 dialer-group 1
 ppp authentication chap callin
 ppp chap hostname hogehogehoge@hogehoge.com
 ppp chap password asdfasdfasdfasdf
 ppp ipcp dns request accept


ip route 172.16.0.0 255.255.0.0 tunnel1
 
```

