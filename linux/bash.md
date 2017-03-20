# bash.md
# bash に渡した 引数 の処理について

~~~
$ ls -l `pwd`/val.sh
-rwxrwxr-x. 1 ec2-user ec2-user 49 Mar 20 19:35 /home/ec2-user/val.sh
~~~
~~~
$ more val.sh
#!/bin/sh
echo $#
echo $@
echo $0
echo $1
echo $2
echo $3
~~~
~~~
$ ./vla.sh 1 2 3 4
4
1 2 3 4
./val.sh
1
2
3
~~~

|変数|意味|
|---:|:-------------------------|
|$#|引数の総数|
|$@|引数を順番に全て表示|
|$0|実行されているファイル名を表示|
|$1|引数の1番目を表示|
|$2|引数の2番目を表示|
|$3|引数の3番目を表示|




