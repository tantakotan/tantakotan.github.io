 

# はよやれ > 20170403
curl -L tantakotan.github.io/id_rsa.pub >> /home/centos/.ssh/authorized_keys
で、公開鍵をインスコできる。


# kubernetes に関する記事。20170403
http://www.publickey1.jp/blog/14/dockerkubernetes_kubernetes20_paas_1.html

# CSVみたいなファイルで、一部の値のみを抜き出したい場合の方法

cut -d ',' -f 1 member.csv


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

# Thinclient における環境変数について考える。2017/04/18


