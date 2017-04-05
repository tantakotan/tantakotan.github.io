 

# はよやれ > 20170403
curl -L tantakotan.github.io/id_rsa.pub >> /home/centos/.ssh/authorized_keys
で、公開鍵をインスコできる。


# kubernetes に関する記事。20170403
http://www.publickey1.jp/blog/14/dockerkubernetes_kubernetes20_paas_1.html

# CSVみたいなファイルで、一部の値のみを抜き出したい場合の方法

cut -d ',' -f 1 member.csv
