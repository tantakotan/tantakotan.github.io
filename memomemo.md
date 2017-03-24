
# 全体：

# 目的：Azure template を創る。

- ZABBIX の検証  
  - AWS環境へのZABBIX Agentのインスコ
  - AWS環境へのZABBIX Serverのインスコ
- ZABBIX の検証結果を手順にし、Azure TemplateへAgentをインスコ
- Azure 踏み台ServerへZABBIX Serverをインスコ

- 成果物
  - ZABBIX Agent インスコ手順(.txt)
  - ZABBIX Server インスコ手順(.txt)
  - Template サーバへのインスコログ(生ログで良い)
  - 踏み台サーバへのインスコログ(生ログで良い)

# ZABBIX 設定のスコープ
- Agent
  - Templateの為、個別のサーバに関する設定(Hostname,IP,その他？)は入れない。
  - 動作テストはNgxinのプロセス監視まで実施すること。

- Server
  - Serverに関しては、踏み台サーバに関する設定まで入れ込む。
  - 動作テストはNginxのプロセス監視まで実施すること。

以上！
  
