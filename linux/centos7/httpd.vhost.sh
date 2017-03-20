#!/bin/bash

# Edit 20170319
v_github_dir="raw.githubusercontent.com/tantakotan/tantakotan.github.io/master/linux"
v_script_name="centos7/httpd.vhost.sh"

# functions
. <(curl -LRs "${v_github_dir}/functions.sh") || echo "$(date -Is) [ERROR]: Failed to load https://${v_github_dir}/functions.sh"

{
	LogInfo "Start \"${v_script_name}\"."
        LogInfo "LogInfo"
	LogNotice "LogNotice"
	LogError "LogError"
}
