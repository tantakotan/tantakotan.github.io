# GitHub [tantakotan] How to use.

1. Group Structure
1. memo
1. tools
1. scripts [.sh]
1. summary


# 1. Group Structure

|HOME|||
|---|-------|-------|
|   |OS     |CentOS6|
|   |       |CentOS7|
|   |       |Windows|
|   |cloud  |aws    |
|   |       |azure  |
|   |tools  ||
|   |memo.md||

# 2. memo.md

- ディレクトリに埋め込みたくないような、ちょっととしたメモを書き込む。

# 3. scripts [.sh]

- スクリプトは、各OSのディレクトリ内に設置する。
- ただし、functions.sh といった共通のスクリプトに関しては、OSフォルダ直下に設置する。

# 4. tools

- ちょっとした用途で使うツールであったりアプリであったり、なんかちょっとしたtips的な物を設置する。
- 標準的な構文(markdownとか)の書き方とかもコチラ。

# 5. summary 

basic
curl -LRs tantakotan.github.io/os/functions.sh

centos6

centos7
curl -LRs tantakotan.github.io/os/centos7/httpd.vhost.sh
curl -LRs tantakotan.github.io/os/centos7/owncloud.sh

windows
