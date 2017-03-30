# Azure CLI2.0 Install

[Azure CLI2.0 Install](https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli)<BR>
(Azure Documents URL)

1. Python 3.5(incorrect)の Install
1. 環境変数を通す。
~~~
 C:\Users\muranaka\AppData\Local\Programs\Python\Python35\Scripts;
 C:\Users\muranaka\AppData\Local\Programs\Python\Python35\;
~~~
3. azure-cli のInstall
~~~
 powershell
  pip install --user azure-cli
~~~







# Azure CLI2.0 Install for Linux<BR>
Ubuntu on windows とかだとクッソ重いのでOS Linux系ディストリビューションの場合のみ実施すること。

[Azure CLI2.0 Install](https://docs.microsoft.com/ja-jp/cli/azure/install-azure-cli)<BR>
(Azure Documents URL)

~~~
bash
    curl -L https://aka.ms/InstallAzureCli | bash
    exec -l $SHELL

~~~
