1. Munin server install
2. munin.conf の設定変更
3. その他

# 前提条件
・今回はZABBIXも入れる為、Muninはhttpdを使って表示させる。  
・Muninはもともとhttpd用に作られている為、nginxだと設定が大変になるので、httpd一本に絞る。

# Munin server install

`sudo yum -y install httpd`  
`sudo yum -y install munin`

# Munin.confの設定変更
```
sudo vi /etc/munin/munin.conf
```
- コメントアウトを外す。
```
 dbdir   /var/lib/munin
 htmldir /var/www/html/munin
 logdir /var/log/munin
 rundir  /var/run/munin
```

- a simple host tree の配下に監視対象の設定を追加。
```
# a simple host tree
[CWR;CWR0101VM01]
    address 13.113.177.9
    use_node_name yes
```

- localhost の設定をコメントアウト
```
# [localhost]
#    address 127.0.0.1
#    use_node_name yes
```
- Munin Web接続用のパスワードを設定
```
htpasswd -c /etc/munin/munin-htpasswd cwr
Password:
Re-type new Password:
Adding password for user cwr
```


# その他
- 強制的にグラフを取得するコマンド
```
su - munin --shell=/usr/bin/munin-cron
```

curl -u cwr:[password] localhost/munin/
で、末尾に<p class="tagline">This page was generated by <a href="http://www.munin-monitoring.org/">Munin</a> version 2.0.30 at 2017-03-24 07:50:05+0000 (UTC).</p>
これが表示されればOK。