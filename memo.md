
# kubernetes に関する記事。20170403
http://www.publickey1.jp/blog/14/dockerkubernetes_kubernetes20_paas_1.html


# 複数行を一括でコメントアウトする方法

http://qiita.com/shirochan/items/174c3169344043449339

# 絶対パスを表示してくれる神コマンド readlink -f <相対パス>

readlink -f <相対パス>

# これを解読しておく。
```
# hostname myconoha
# sed -i -e '/^HOSTNAME=.*$/d' /etc/sysconfig/network
# echo 'HOSTNAME='`hostname` >> /etc/sysconfig/network
# sed -i -e 's/^\(127\.0\.0\.1.*\)$/\1 '`hostname`'/g' /etc/hosts
```

# Thinclient におけるWindowsの開発環境について考える。2017/04/18


# Firewalld の開け方の方針を決める。
