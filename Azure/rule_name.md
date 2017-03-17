# Azure Network Security Group 命名規則について

~~~
AllowVnetInBound
[Action][Source][vector(In/Out)]
~~~

「どのソースから」
「どの方向で」
「許可するかしないか」
がベースになっている。<BR>
このようにしておけば、プロトコル単位での確認というよりは シンプルに通信フローから考えての許可・破棄が確認できる。<BR>

他の命名規則にも応用できそう。
