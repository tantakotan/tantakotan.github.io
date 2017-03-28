#
# - Name
#     Ssh-TeraTerm.ps1
# 
# - Contents
#     Simplify SSH Connect by Tera Term.
# 
# - Revision
#     2016-12-28 created.
#     yyyy-MM-dd modified.
# 

# Date
[String] $yyyy = Get-Date -Format yyyy
[String] $mm = Get-Date -Format MM
[String] $dd = Get-Date -Format dd
[String] $hh = Get-Date -Format HH
[String] $mi = Get-Date -Format mm
[String] $ss = Get-Date -Format ss
[String] $tz = Get-Date -Format zzz

# Directory
[String] $ssh_dir = $Env:Userprofile + "\GoogleDrive\ssh" # 作業ディレクトリ
[String] $log_dir = $ssh_dir + "\log" # teratermログ出力ディレクトリ
[String] $key_dir = $ssh_dir + "\key" # 秘密鍵設置ディレクトリ

# Csv = Hostname,Port,Username,AuthType,Value,Alias
[String] $csv_file = $ssh_dir + "\Ssh-TeraTerm.csv" # 任意の場所にログイン情報を記載したCSVを設置

# Get full path (ttermpro.exe)
[String] $ssh_client = Get-ChildItem -recurse "C:\Program Files*\teraterm" | Where-Object { $_.Name -match "ttermpro" } | ForEach-Object { $_.FullName } # teratemrインストールディレクトリからttermpro.exeを検索
if ( $ssh_client -notlike "*ttermpro.exe" ) {
    Write-Output "[ERROR]: ttermpro.exe not found in `"C:\Program Files*`"."
    Start-Sleep 5
    exit 1
}


if ( $args )
{
    # スクリプトの引数[1]には<username>@<hostname>形式を想定
    [String] $ssh_alias = $args[0]
    [Array] $ssh_args = $args[0] -split "@"
    [String] $ssh_log = $log_dir + "\" + $ssh_args[1] + "_" + $ssh_args[0] + "_" + $yyyy + $mm + $dd + "_" + $hh + $mi + $ss + ".log"
    
    # Import-Csv
    [Array] $csv_data = Import-Csv $csv_file | Where-Object { $_.Alias -eq $ssh_alias }
    
    if ( $csv_data )
    {
        # Compose Options
        [String] $opt_host = "ssh2://" + $csv_data[0].Hostname + ":" + $csv_data[0].Port
        [String] $opt_user = "/user=" + $csv_data[0].Username
        [String] $opt_auth = "/auth=" + $csv_data[0].AuthType
        if ( $csv_data[0].AuthType -eq "password" )
        {
            [String] $opt_value = "/passwd=" + $csv_data[0].Value
        }
        elseif ( $csv_data[0].AuthType  -eq "publickey" )
        {
            [String] $opt_value = "/keyfile=" + $key_dir + "\" + $csv_data[0].Value
        }
        [String] $opt_dir = "/FD=" + $ssh_dir
        [String] $opt_log = "/L=" + $ssh_log

        [String] $opt_array = @($opt_host,$opt_user,$opt_auth,$opt_value,$opt_dir,$opt_log,"/ssh-v","/LA=J")

        # Execute $ssh_client
        Start-Process -FilePath $ssh_client -ArgumentList $opt_array -Wait
    }
    else 
    {
        # Compose Options
        [String] $opt_dir = "/FD=" + $ssh_dir
        [String] $opt_log = "/L=" + $ssh_log

        [Array] $opt_array = @($opt_dir,$opt_log,"/ssh-v","/LA=J")

        # Execute $ssh_client
        Import-Csv $csv_file | Select-Object Alias,Hostname,Username | Write-Host
        Start-Process -FilePath $ssh_client -ArgumentList $opt_array -Wait
    }
}
else
{
    # Execute $ssh_client
    Start-Process -FilePath $ssh_client
}
