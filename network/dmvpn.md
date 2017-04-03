# DMVPN の一般的な設定 for IOS 15.x with OSPF 

- DMVPN HUB configuration
- DMVPN Spoke Configuration
- Other PPPoE Server Configuration

# DMVPN Hub Configuration

```
(config)# interface tunnel [num]

(config-if)# ip address [ip] [mask]

(config-if)# tunnel source [ip:nhs tunnel source] | [IF:tunnel source]
(config-if)# tunnel mode gre multipoint
(config-if)# tunnel key [num:key-id]
(config-if)# tunnel protection ipsec profile [string:ipsec-profile]

(config-if)# ip nhrp network-id [num:network-id]
(config-if)# ip nhrp map multicast dynamic
(config-if)# ip nhrp authentication [string:nhrp-auth-key]

(config-if)# ip ospf network broadcast
(config-if)# ip ospf priority 255
```

|コマンド引数|説明|
|---:|:---|
|[num]|任意のTunnelインターフェースの番号を指定（対向機器と合わせる必要なし）|
|[ip] [mask]|Tunnelインターフェース用のIPアドレスを指定|
|[ip:nhs tunnel source]|GREトンネルの送信元IPアドレスを指定（ここで指定したIPがGREヘッダの送信元IP）|
|[IF:tunnel source]|GREトンネルの送信元Interfaceを指定（ここで指定したIFのIPがGREヘッダの送信元IP）|
|[num:key-id]|任意：Tunnelインターフェース用のIDを指定（ルータ内で複数のmGRE I/Fの作成時に使用）|
|[string:ipsec-profile]|mGREインターフェースにひもづけるIPsecプロファイルを指定|
|[num:network-id]|NHRPのプロセス番号。別に対向ルータと合わせる必要も無い|
|[string:nhrp-auth-key]|NHRP の認証に用いる key。Hub と Spoke で合わせる|



### DMVPN NHRP Configuration (for Spoke)

```
(config)# interface tunnel [num]

(config-if)# ip address [ip] [mask]

(config-if)# tunnel source [ip:spoke tunnel source] | [IF:tunnel source]
(config-if)# tunnel mode gre multipoint
(config-if)# tunnel key [num:key-id]
(config-if)# tunnel protection ipsec profile [string:ipsec-profile]

(config-if)# ip nhrp nhs [ip:nhs tunnel source]
(config-if)# ip nhrp map [ip:nhs tunnel source] [ip:nhs tunnel address]
(config-if)# ip nhrp map multicast [ip:nhs tunnel address]
(config-if)# ip nhrp network-id [num:network-id]
(config-if)# ip nhrp authentication [string:nhrp-auth-key]

(config-if)# ip ospf network broadcast
(config-if)# ip ospf priority 0
```

|コマンド引数|説明|
|---:|:---|
|[num]|任意のTunnelインターフェースの番号を指定（対向機器と合わせる必要なし）|
|[ip] [mask]|Tunnelインターフェース用のIPアドレスを指定|
|[ip:spoke tunnel source] |GREトンネルの送信元IPアドレスを指定（ここで指定したIPがGREヘッダの送信元IP）|
|[num:key-id]|任意：Tunnelインターフェース用のIDを指定（ルータ内で複数のmGRE I/Fの作成時に使用）|
|[string:ipsec-profile]|mGREインターフェースにひもづけるIPsecプロファイルを指定|
|[ip:nhs tunnel source]|NHS の Tunnel source で指定した IP アドレス を指定|
|[ip:nhs tunnel address]|NHS の NBMA(WAN側の実IP)  IP アドレス を指定|
|[num:network-id]|NHRPのプロセス番号。別に対向ルータと合わせる必要も無い|
|[string:nhrp-auth-key]|NHRP の認証に用いる key。Hub と Spoke で合わせる|



# Other

```
username a password 0 a
username b password 0 b
username c password 0 c

bba-group pppoe g1
 virtual-template 1
!
bba-group pppoe g2
 virtual-template 2
!
bba-group pppoe g3
 virtual-template 3

interface Ethernet0/0
 no ip address
 pppoe enable group g1
!
interface Ethernet0/1
 no ip address
 pppoe enable group g2
!
interface Ethernet0/2
 no ip address
 pppoe enable group g3

interface Virtual-Template1
 mtu 1454
 ip unnumbered Loopback0
 peer default ip address pool POOL1
 ppp authentication chap
!
interface Virtual-Template2
 mtu 1454
 ip unnumbered Loopback0
 peer default ip address pool POOL2
 ppp authentication chap
!
interface Virtual-Template3
 mtu 1454
 ip unnumbered Loopback0
 peer default ip address pool POOL3
 ppp authentication chap
!
ip local pool POOL1 1.1.1.1
ip local pool POOL2 2.2.2.2
ip local pool POOL3 3.3.3.3
ip forward-protocol nd
```




