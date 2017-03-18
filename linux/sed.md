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

# sed の基本記法
sed -r -e "<font color=red>**s**</font>/aaaa/bbbb/<font color=blue>g</font>"<BR>
<font color=red>**s**</font> = Substitute(置換)<BR>
<font color=blue>**g**</font> = Global(行の内、全ての同じ文言を検索。指定しないと最初にHitしたもののみが対象になる。)<BR>
aaaa = 置換先の文字列
bbbb = 置換後の文字列(空白の場合、置換先の文字列を削除する。)

## デリミタ
Substitute では、/が用いられることが多いが、実際はどんな文字でも良い。<BR>
s の次の文字がデリミタとしてみなされる。<BR>
`sed -r -e 's@aaaa@bbbb@g'`

## [Option]

-r = regexp-extended<BR>
-n = quiet,silent (何でnなのかわからんけど...)<BR>
-e = script<BR>
※ -n と -e は同居不可<BR>

