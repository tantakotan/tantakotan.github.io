# Windows 環境構築プロジェクト
# <KBD>Windows</KBD> + <KBD>R</KBD> ⇒ SSH hogehoge で、SSH接続を可能にする。

# 項目分析

1. ディレクトリ構造の設置と理解
1. Windows の環境変数の追加
1. SSH接続用 Powershell スクリプトの作成
1. SSHパラメータ用 CSV の作成
1. Powershell スクリプト への ショートカットの作成

## 1. ディレクトリ構造の設置と理解。

|1|2|3|4|備考|
|---|---|---|---|---|
|%userprofile%|GoogleDrive|path||WindowsのPATHを通すフォルダ|
|||ssh||SSH用のCSVファイルを設置するフォルダ|
|||ssh|key|SSH用の秘密鍵を設置するフォルダ|
|||ssh|log|SSH用のログを設置するフォルダ|
|||ps1||起動用の Powershell スクリプト を保存するフォルダ|

## 2. Windows の環境変数の追加<BR>

{{{Point}}}<BR>
Windows の PATH を通す数は出来るだけ少ない方が良い。<BR>
その為、どこかに PATH を通しまくりたい時には、path フォルダにリンクを作成する方法を採る。<BR>

- Path 追加<BR>
1. <KBD>Windows</KBD> + <KBD>Pause</KBD> を押下
1. システムの詳細設定 を押下
1. 環境変数(N) を押下
1. システム環境変数から Path を選択して、編集(I)を押下
1. 新規(N) を押下
1. %userprofile%\GoogleDrive\path を設定


## 3.SSH接続用 Powershell スクリプトの作成

1. Ssh-TeraTerm.ps1 を ps1 に設置する。
※要受け取り。

## 4. SSHパラメータ用 CSV の作成

1. Ssh-TeraTerm.csv を ssh に設置する。
1. Hostname,Port,Username,AuthType,value,Alias の配列で構成されているので適宜変更。

|パラメータ|説明|
|---|---|
|Hostname|SSH接続先のHostname|
|Port|SSH の接続先ポート番号。デフォルトは22|
|Username| SSH で使用する Username|
|AuthType| `Password` or `publickey`|
|value| Password の場合は Password を記入。<BR>publickey の場合は、key のファイル名を記入。|
|Alias| ココに設定した値が、SSH を呼び出すときの引数になる。|


## 5. Powershell スクリプト への ショートカットの作成

1. path フォルダに、Ssh-TeraTerm.ps1 へのショートカットリンクをファイル名 ssh で作成。


EOF

