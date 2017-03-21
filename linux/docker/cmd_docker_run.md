- コンテナの立ち上げコマンド

`docker run [Option] --name [container-name] [image-name]`

- docker run option list

|Opt|content|
|---:|:----------------------------------------------------------------------|
|-d|コンテナをバックグラウンドで起動|
|-p|「HostOS側ポート番号:コンテナ側ポート番号」のようにポートマッピングを指定|
|-v|「HostOS側ディレクトリ:コンテナ側ディレクトリ」のように共有ディレクトリを指定|
|-i|STDINを常に開く|
|-t|ttyを割り当てる|

STDIN = 標準出力的な何か<BR>
tty: http://qiita.com/toshihirock/items/22de12f99b5c40365369<BR>
元来、teletypewiter のこと。標準入出力となっている端末デバイスを表示するコマンド。<BR>



