## よく使う記法

- grep と同義<BR>
`sed -r -e /"ip"/\!d`  

------------------------------------------------------------------------
- grep の 例
~~~

$ curl ipinfo.io
{
  "ip": "13.113.30.151",
  "hostname": "ec2-13-113-30-151.ap-northeast-1.compute.amazonaws.com",
  "city": "Tokyo",
  "region": "Tokyo",
  "country": "JP",
  "loc": "35.6427,139.7677",
  "org": "AS38895 Amazon.com, Inc.",
  "postal": "100-0001"
}[ec2-user@ip-172-16-0-21 ~]$

$ curl ipinfo.io | sed -r -e /"ip"/\!d
  "ip": "13.113.30.151",
~~~
------------------------------------------------------------------------
- Substitute
~~~
curl ipinfo.io | sed -r -e /"ip"/\!d -e 's/  "ip": "//g' 
13.113.30.151",
~~~
------------------------------------------------------------------------
- Substitute を 繋げる場合 は、-e を半角スペースで接続するだけで良い。
~~~
curl ipinfo.io | sed -r -e /"ip"/\!d -e 's/  "ip": "//g' -e 's/",//g'
13.113.30.151
~~~
------------------------------------------------------------------------
- スマートな IPアドレスの表示方法<BR>
~~~
curl ipinfo.io | sed -n '2s/[^0-9|\.]//gp'
13.113.30.151
~~~
------------------------------------------------------------------------

# sed の基本記法(script)
sed -r -e "<font color=red>**s**</font>/aaaa/bbbb/<font color=blue>g</font>"<BR>
<font color=red>**s**</font> = Substitute(置換)<BR>
<font color=blue>**g**</font> = Global(行の内、全ての同じ文言を検索。指定しないと最初にHitしたもののみが対象になる。)<BR>
aaaa = 置換先の文字列
bbbb = 置換後の文字列(空白の場合、置換先の文字列を削除する。)

`sed -n '2s/[^0-9]|\.]//gp'`<BR>
-n = 出力を全て隠す<BR>
2s = 出力の2行目を指定<BR>
[^0-9]|\. = 数字、かつ . を抽出<BR>
g = 行の全ての文字を置換<BR>
p = 指定の行のみ出力する。<BR>

## デリミタ
Substitute では、/が用いられることが多いが、実際はどんな文字でも良い。<BR>
s の次の文字がデリミタとしてみなされる。<BR>
`sed -r -e 's@aaaa@bbbb@g'`

## [Option]

-r = regexp-extended<BR>
-n = quiet,silent (何でnなのかわからんけど...)<BR>
-e = script<BR>
※ -n と -e は同居不可<BR>

# sed による ファイルの中身の置換

- 手順の確認

1. `sed -r -e 's@@@g'` まで書く。これが sed 置換式の基本。
1. 置換対象をメモ。<BR>
`my $logtail = '/usr/local/bin/logtail';`
1. 置換後をメモ。 <BR>
`my $logtail = '/usr/sbin/logtail';`
1. 置換対象を式に入れ込む。<BR>
`sed -r -e 's@(my \$logtail = '"'"'/usr/local/bin/logtail'"'"';)@@g'`
1. 置換対象をコメントアウトし、同時に日付を入れる。<BR>
`sed -r -e 's@(my \$logtail = '"'"'/usr/local/bin/logtail'"'"';)@# '"$(date +%Y%m%d)"' #\1\n@@g'`
1. 置換後を追加。<BR>
`sed -r -e 's@(my \$logtail = '"'"'/usr/local/bin/logtail'"'"';)@# '"$(date +%Y%m%d)"' #\1\nmy \$logtail = '"'"'/usr/sbin/logtail'"'"';@g'`
1. 設定対象ファイルを文末に追加。<BR>
`sed -r -e 's@(my \$logtail = '"'"'/usr/local/bin/logtail'"'"';)@# '"$(date +%Y%m%d)"' #\1\nmy \$logtail = '"'"'/usr/sbin/logtail'"'"';@g' /usr/share/munin/plugins/byprojects_bandwidth`
1. 標準出力をチェック <kbd>ENTER</kbd>
1. 問題なければ、文末に -i を付け加えて、ファイルに上書き。<BR>
`sed -r -e 's@(my \$logtail = '"'"'/usr/local/bin/logtail'"'"';)@# '"$(date +%Y%m%d)"' #\1\nmy \$logtail = '"'"'/usr/sbin/logtail'"'"';@g' /usr/share/munin/plugins/byprojects_bandwidth -i`


