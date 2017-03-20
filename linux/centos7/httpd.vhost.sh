#!/bin/bash

set -eu

# Edit 20170319
v_github_dir="raw.githubusercontent.com/tantakotan/tantakotan.github.io/master/linux"
v_script_name="centos7/httpd.vhost.sh"
v_functions="curl -fLRs "${v_github_dir}/functions.sh""

# functions
. <(${v_functions}|| echo exit 11)

{
        LogInfo "Start \"${v_script_name}\"."
        LogInfo "LogInfo"
        LogNotice "LogNotice"
        LogError "LogError"
        echo "unko"
}
