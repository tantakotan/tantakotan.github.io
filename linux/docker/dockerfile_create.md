# CentOS6 では、CentOS7 を Docker で入れるのは超大変なのでやめておきましょう！！
ホストがCentOS 6の場合、このページの記述通りにdocker runを実行してもコンテナ内でsystemctl実行時に「Failed to get D-Bus connection: Failed to connect to socket /run/systemd/private: Connection refused」というエラーメッセージが出る。
これはカーネルのバージョンが古いため。

# Docker コンテナ 作成 プロジェクト

- phase 1: Docker,Host OS の作成
- Phase 2: Docker File の作成
- Phase 3: Docker File での コンテナ作成
- Phase 4: Docker Image の作成
- Phase 5: Docker Image での コンテナ作成

## Phase 1: Docker, Host OSの作成

```
sudo yum -y install yum-utils
```
```
v_epel_url="https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
sudo yum -y install "${v_epel_url}"
```
```
sudo yum-config-manager --disable epel*
```
```
sudo yum -y --enablerepo=epel install docker
```

## Phase 2: Docker File の作成

- Docker File の作成手順。
1. ベースにする Docker イメージを決める
1. docker run -it <docker-image> でコンテナ内部で作業 ※/bin/bash はデフォルトで動作する。
1. 1行ずつ、うまくいったらどこかにメモ
1. 失敗したらいったん exit して再度 docker run
1. ファイルの取り込みやポートの外部公開が必要ならオプション付きで docker run
1. 全部うまくいったら Dockerfile にする

- 各ツールの -y オプションや、 yes を使い、対話無しで実行できるようにすること。
- ファイルの上書きなどは、-f 等を用いて、強制オプションをつけること。
- 不要なログを抑える為、curl -s , wget -q の利用を行うこと。
- バックアップ ファイルの作成はおこなわないこと。
- 設定を間違えた時、設定値がおかしくなってしまったときは、一度 exit してからやり直すこと。
- この際、経過地点を設定し、`exit & docker commit`で、経過イメージを作っておくようにすること。
- 外部からの接続を前提にしている為、あらかじめ`docker run -it -p 80:8-0 centos:6 /bin/bash`のようにポートをホスト側に公開しておくこと。
- 外部ファイルを取り込む必要があるなら、`docker run -it -v $(pwd):/tmp/share centos:6 /bin/bash`のようにして、ホスト側の作業フォルダをコンテナ内にマウントしておくこと。


## ベースにする Docker イメージを決める
`centos:7`

## docker run -it <docker-image> でコンテナ内部で作業
`docker run -it centos:7`

## 1行ずつ、うまくいったらどこかにメモ

docker run -it centos:7

v_epel_url="https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
yum -y -q install "${v_epel_url}" 2>&1
yum-config-manager --disable epel* >/dev/null 2>&1
yum -y -q install nginx --enablerepo=epel 2>&1

sed -f /etc/nginx/conf.d/default.-r -e 's/
