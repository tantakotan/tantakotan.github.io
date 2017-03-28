# どこでも SSH 環境構築

1. ディレクトリ構造の作成
1. 環境変数の追加
1. Powershell 実行用のショートカットの作成
1. Powershell の作成
1. CSV の作成


# ディレクトリ構造の作成

%userprofile%\GoogleDrive
%userprofile%\GoogleDrive\path
%userprofile%\GoogleDrive\ps1
%userprofile%\GoogleDrive\ps1\key
%userprofile%\GoogleDrive\ps1\log
%userprofile%\GoogleDrive\ssh

# 環境変数の追加

Path: %userprofile%\GoogleDrive\path
Pathexe: LNK

# powershell 実行用のショートカットの作成

ショートカットの作成
リンク先: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe %userprofile%\GoogleDrive\ps1\Ssh-TeraTerm.ps1
作業フォルダ: %userprofile%\GoogleDrive\ps1

# Powershell の作成

https://github.com/tantakotan/tantakotan.github.io/tool/Ssh-TeraTerm.ps1  
を参照

# CSV の作成

Hostname,Port,Username,AuthType,Value,Alias
ex: 192.168.1.1,22,root,publickey,id-rsa,aws1

↑この場合、ファイル名を指定して実行で ssh aws1 と実行すればよい。
Hostname = ipaddress
Port = 22(ssh) か 23(Telnet)
Username = root とか ec2-user とか
Authtype = publickey, p@ssw0rd
value = key の場所, パスワード
Alias = エイリアス。

