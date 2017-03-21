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
v_epel_url="https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm"
sudo yum -y install "${v_epel_url}"
```
```
sudo yum-config-manager --disable epel*
```
```
sudo yum -y --enablerepo=epel install docker-io
```
※CentOS6 は、Docker 非対応。その為、docker-io を入れる。

## Phase 2: Docker File の作成

- Docker File の作成手順。
1. ベースにする Docker イメージを決める
1. docker run -it <docker-image> sh でコンテナ内部で作業
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


