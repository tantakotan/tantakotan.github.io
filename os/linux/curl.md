# Curl option list

## よく使う記法

現在使用しているクライアントの接続元グローバルIPアドレスの調査<BR>
`curl ipinfo.io | sed -r -e /"ip"/\!d -e 's/  "ip": "//g' -e 's/",//g'`

ipinfo.io が返してくるのは Json なので、jq を入れていれば↓がスマート<BR>
`curl ipinfo.io | jq -r .ip`

#### SSL に関連する記法

SSL のエラーをスキップする。(安全でない接続を行う。)<BR>
`curl -k https://www.tantakotan.tech/ `

SSL の Version を指定できる。<BR>
|-1, --tlsv1<BR>
|-2, --sslv2<BR>
|-3, --sslv3<BR>
```
curl -k -1 https://www.tantakotan.tech/
curl -k -2 https://www.tantakotan.tech/
curl -k -3 https://www.tantakotan.tech/
```





# Option list

|Option|Description|
|--------|----------------------------------------|
|-a, --append |FTPアップロード時にファイルを上書きではなく追記する||
|-d, --data PARAM... |POSTリクエストとしてフォームを送信する。パラメータPARAMは「"value=name"」の形式で指定する|
|-e, --referer URL |リファラーをURLで指定する|
|-f, --fail |サーバエラーが発生したら黙って終了する|
|-i, --include |HTTPヘッダを出力に含める|
|-k, --insecure |SSL/TLSのエラーをスキップする（安全でないSSL/TLS接続を行う）|
|-m, --max-time TIME |最大転送時間をTIME秒に制限する|
|-o FILE |取得したデータを指定したファイルFILEに出力する|
|-r, --range FROM-TO |ファイルの先頭位置をFROM, 範囲をTOバイトとして分割してダウンロードする|
|-s, --silent	|進捗状況やエラーを表示しない|
|-u USER[:PASS]	|認証に用いるユーザー名USER, パスワードPASSを指定する（基本認証など）|
|-v, --verbose	|リクエストとレス本をを表示する|
|-x HOST[:PORT]	|プロキシサーバとしてホストHOSTおよびポートPORTを利用する|
|-y, --speed-time TIME	|転送速度が指定した速度をTIME秒の間下回ったらダウンロードを終了する。速度は-Yオプションで指定する|
|-A, --user-agent AGENT	|ユーザーエージェントAGENTを指定する|
|-B, --use-ascii	|FTPでASCII転送を有効にする|
|-C, --continue-at OFFSET	|以前のファイル転送の続きから再開する（OFFSETは先頭からの読み飛ばしバイト数、「-」ならcurlが|自動的に処理）|
|-D, --dump-header FILE	|プロトコルヘッダをファイルFILEに書き込む|
|-E, --cert CERT[:PASS]	|SSL/TLS接続時にクライアント証明書CERTを使用する|
|-F, --form PARAM	|フォーム入力で送信ボタンを押した状況を行う。パラメータPARAMは「"name=content"」の形式で指定する|
|-G, --get	|HTTP GETリクエストで送信する|
|-H, --head HEADER	|HTTPヘッダにHEADERを追加もしくは変更する|
|-I, --head	|ヘッダ情報を取得する|
|-K, --config FILE	|設定ファイルFILEを読み込、それを引数として実行する|
|-L, --location	|リダイレクトに対応する|
|-O, --remote-name	|取得したデータを標準出力ではなくファイルに出力する|
|-R, --remote-time	|ダウンロードしたファイルのタイムスタンプをサーバ上のタイムスタンプに合わせる|
|-T, --upload-file FILE	|ファイルFILEをアップロードする|
|-U, --proxy-user USER[:PASS]	|プロキシ認証に用いるユーザー名USER, パスワードPASSを指定する|
|-Y, --speed-limit BPS	|転送速度がBPSバイト/秒を一定時間下回ったらダウンロードを終了する。時間は-yオプションで指定する|
|-Z, --max-redirs MAX	|リダイレクトを最大MAX回に制限する|
|-#, --progress-bar	|進捗状況を表示する|
|-0, --http1.0	|HTTP 1.0でリクエストする|
|-1, --tlsv1	|TSLバージョン1.xを使ってネゴシエーションを行う|
|-2, --sslv2	|SSLバージョン2を使ってネゴシエーションを行う|
|-3, --sslv3	|SSLバージョン3を使ってネゴシエーションを行う|
|-4, --ipv4	|IPv4で名前解決する|
|-6, --ipv6	|IPv6で名前解決する|
|--http1.1	|HTTP 1.1でリクエストする（デフォルト）|
|--http2	|HTTP 2でリクエストする|
|--cacert CACERT	|証明書ファイルCACERTを検証に用いる|
|--capath DIR	|証明書ディレクトリDIRを検証に使用する|
|--compressed	|ファイルの圧縮をサポートする|
|--create-dirs	|必要に応じてディレクトリを作成する|
|--connect-timeout TIME	|最大接続時間をTIME秒に制限する|
|--digest	|ダイジェスト認証を有効にする|
|--dns-servers ADDRESS	|名前解決に利用するDNSサーバのIPアドレスを指定する|
|--ftp-create-dirs	|FTP接続時に必要に応じてディレクトリを作成する|
|--ftp-pasv	|FTPのパッシブモードを使用する|
|--limit-rate SPEED	|最大転送速度をSPEEDバイト/秒に制限する（単位としてK/G/Mを利用可）|
|--retry NUM	|エラーが出た場合、NUM回数だけ再試行する|
|--ssl	|接続時にSSL/TLSの利用を試みる|
|--url URL	|アクセスするURLを指定する（設定ファイル内）
