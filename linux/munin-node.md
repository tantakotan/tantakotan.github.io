------
1. munin-node の インストール
1. munin-node.conf の更新
1. munin-node/plugins の更新
1. plugins 用のコンポーネントのインストール
1. plugins の設定変更
1. nginx.conf に Munin Plugin 用の設定追加
1. iptables の穴あけ
1. munin-node の自動開始設定を追加
------
------
[Option]
1. plugins にユーザを追加する際の設定事項と注意事項
------

# 1. munin-node のインストール

## Munin-node の Install

`sudo yum -y install munin-node --enablerepo=epel`

# 2. munin-node.conf の更新

## config の 保存

`sudo cp -v /etc/munin/munin-node.conf ./munin-nocd.conf.org`

## config file の追加

- server hostname の変更<BR>
`host_name CWR0101VM01`

- manager の Accesslist の追加<BR>
`allow ^13\.115\.247\.215$`

-- And which port(待ち受けポート) の変更<BR>
`port 14949`

# 3. munin-node/plugins の更新

- plugins 保存先に移動

`cd /usr/share/munin/plugins`

- plugins の Downloads

```
sudo curl -LRs -o byprojects_access https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/nginx/nginx_byprojects/byprojects_access
sudo curl -LRs -o byprojects_bandwidth https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/nginx/nginx_byprojects/byprojects_bandwidth
sudo curl -LRs -o byprojects_inout_bandwidth https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/nginx/nginx_byprojects/byprojects_inout_bandwidth
```

- plugins に実行権限を付与

`sudo chmod +x byprojects_*`

- plugins に対し、シンボリックリンクを追加

```
default:
ln -s /usr/share/munin/plugins/nginx_request
ln -s /usr/share/munin/plugins/nginx_status
```
```
download:
ln -s /usr/share/munin/plugins/byprojects_access
ln -s /usr/share/munin/plugins/byprojects_inout_bandwidth
ln -s /usr/share/munin/plugins/byprojects_bandwidth
```

# 4.plugins 用のコンポーネントのインストール

- logtail の install
`sudo yum -y install logcheck --enablerepo=epel`

# 5.plugins の設定変更

- logtail の install 先の変更...の前にpluginsのバックアップ
```
cp -v /usr/share/munin/plugins/byprojects_access /usr/share/munin/plugins/byprojects_access.org
cp -v /usr/share/munin/plugins/byprojects_inout_bandwidth /usr/share/munin/plugins/byprojects_inout_bandwidth.org
cp -v /usr/share/munin/plugins/byprojects_bandwidth /usr/share/munin/plugins/byprojects_bandwidth.org
```

- Plugin の中に記載されている logtail の install 先の変更
```
sed -r -e 's@(my \$logtail = '"'"'/usr/local/bin/logtail'"'"';)@# '"$(date +%Y%m%d)"' #\1\nmy $logtail = '"'"'/usr/sbin/logtail'"'"';@g'  /usr/share/munin/plugins/byprojects_access -i
sed -r -e 's@(my \$logtail = '"'"'/usr/local/bin/logtail'"'"';)@# '"$(date +%Y%m%d)"' #\1\nmy $logtail = '"'"'/usr/sbin/logtail'"'"';@g'  /usr/share/munin/plugins/byprojects_inout_bandwidth -i
sed -r -e 's@(my \$logtail = '"'"'/usr/local/bin/logtail'"'"';)@# '"$(date +%Y%m%d)"' #\1\nmy $logtail = '"'"'/usr/sbin/logtail'"'"';@g'  /usr/share/munin/plugins/byprojects_bandwidth -i
```

- plugin.conf の中に NGINX 用の設定追加

```
sed -e '$ a \\n[nginx*]\n env.url http://localhost/nginx_status' /etc/munin/plugin-conf.d/munin-node -i
```



# 6.nginx.conf に Munin Plugin 用の設定追加

- nginx.conf に log_format の設定追加
  log_format munin  ‘$remote_addr - $remote_user $time_local “$request” ‘
                    ‘$status $body_bytes_sent “$http_referrer” ‘
                    ‘”$http_user_agent” $request_length $body_bytes_sent’;

- この行の前に挿入していくことにする。
    access_log  /var/log/nginx/access.log  main;

```
sed '/    access_log  \/var\/log\/nginx\/access.log  main;/i \    log_format munin  '"'"'$remote_addr - $remote_user $time_local "$request" '"'"'\n                      '"'"'$status $body_bytes_sent "$http_referer" '"'"'\n                      '"'"'"$http_user_agent" $request_length $body_bytes_sent'"'"';\n\n' /etc/nginx/nginx.conf

```
## これも default.conf に設定しておくこと。server ディレクティブのところに。
------
        listen 127.0.0.1;
        listen [::1]:80;
        server_name localhost;
        #### munin ####
        location /nginx_status {
            stub_status on;
            access_log off;
            allow 127.0.0.1;
            allow ::1;
            deny all;
        }
        #### munin ####
------




# 7.iptables の穴あけ


# 8.munin-node の自動開始設定の追加


`chkconfig munin-node on`



