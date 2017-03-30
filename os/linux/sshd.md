# EC2等での SSH を PSK に変更する方法。

- .conf バックアップ

`sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.org`

- .conf を開く

`sudo vi /etc/ssh/sshd_config`

- .conf をいじる

```
PermitRootLogin no         #rootでのログインを拒否
PermitEmptyPasswords no    # 空パスワードでのログインを拒否
PasswordAuthentication yes #パスワード認証にする
RSAAuthentication no       # RSAでの認証を拒否。← protocol 1の場合。鍵認証を残しておきたい場合はyesにしよう
PubkeyAuthentication yes    # 公開鍵での認証を拒否。← protocol 2の場合。鍵認証を拒否する場合はnoにしよう
```

- sshdを再起動

`sudo /etc/rc.d/init.d/sshd restart`
