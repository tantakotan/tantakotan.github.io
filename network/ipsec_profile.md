# Cisco
# "IPsec configuration"


```

crypto isakmp policy 100
  encr aes 256
  authentication pre-share
  group 2
  lifetime 28800

crypto isakmp key cisco address 1.1.1.1

crypto isakmp profile isakmp-hogehoge01VNG
   keyring keyring-hogehoge01VNG
   match identity address 1.1.1.1 255.255.255.255
   local-address 2.2.2.2
 
crypto ipsec transform-set ipsec-trans-hogehoge01VNG esp-aes 256 esp-sha-hmac
   mode tunnel

crypto ipsec df-bit clear

crypto ipsec profile ipsec-prof-hogehoge01VNG
 set transform-set ipsec-trans-hogehoge01VNG
 
interface Tunnel1
 ip unnumbered FastEthernet0
 ip virtual-reassembly in
 ip tcp adjust-mss 1350
 tunnel source 2.2.2.2
 tunnel mode ipsec ipv4
 tunnel destination 1.1.1.1
 tunnel protection ipsec profile ipsec-prof-hogehoge01VNG isakmp-profile isakmp-hogehoge01VNG

ip route 0.0.0.0 0.0.0.0 tunnel1
 
```

