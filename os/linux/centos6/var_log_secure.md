# /var/log/secure を気合で消したときの話

touch /var/log/secure でファイルを作り直しても、syslog が作成されない…なぜか？<BR>

結論: rsyslogd がバグる。<BR>
Workaround: rsyslog を再起動すればOKPK<BR>

# 調べたこと

### SSHD の設定確認！

(もともと、SSHのログを調べていた時のことなので)ssh の吐き出すログは、<BR>
誰がどこにどうやって設定しているのかを確認した。<BR>

ssh の 設定ファイルの中に、rsyslog の AUTHPRIV に対する出力の設定があった。<BR>
configの場所: /etc/ssh/sshd_config<BR>
設定箇所: 36 SyslogFacility AUTHPRIV

では、rsyslog の AUTHPRIV はどのような設定なのか？？

### rsyslog の設定確認！

config の場所: /etc/rsyslog.conf
設定箇所: <BR>
44 \# The authpriv file has restricted access.<BR>
45 authpriv.*                                              /var/log/secure<BR>

特にコレといった設定は無い…。<BR>
では、rsyslog 自体が /var/log/secure のログファイルが無い！ というエラーを出しているのではないか？？

### rsyslog のログを確認！！

Log の場所: /var/log/messages<BR>
Log の内容: <BR>
Mar 31 09:26:48 ip-192-168-1-11 rsyslogd: [origin software="rsyslogd" swVersion="5.8.10" x-pid="864" x-info="http://www.rsyslog.com"] exiting on signal 15.
Mar 31 09:26:48 ip-192-168-1-11 kernel: imklog 5.8.10, log source = /proc/kmsg started.
Mar 31 09:26:48 ip-192-168-1-11 rsyslogd: [origin software="rsyslogd" swVersion="5.8.10" x-pid="18402" x-info="http://www.rsyslog.com"] start

何か出ている。/proc/kmsg とは何ぞや。

cat /proc/kmsg<BR>
としても、何も表示されない…。

http://oki2a24.com/2013/10/30/use-dmesg-to-read-proc-kmsg-log-of-iptables/

なるほど、わからん。

ということで、ここらへんで rsyslog に問題がありそうなことはわかったので、rsyslog を再起動。
再起動後、/var/log/secure にログが出力されていることを確認。

```
service rsyslog restart
tail -n 100 /var/log/secure
```


