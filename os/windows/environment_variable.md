## PATH に %userprofile%\GoogleDrive\path を追加
[Environment]::SetEnvironmentVariable("PATH", "$env:PATH;$env:USERPROFILE\GoogleDrive\path", [EnvironmentVariableTarget]::User)

## PATHEXT に .LNK を追加
[Environment]::SetEnvironmentVariable("PATHEXT", "$env:PATHEXT;.LNK", [EnvironmentVariableTarget]::User)

管理者権限いらないので、シンクラだろうがユーザアカウントだろうが追加できる。

