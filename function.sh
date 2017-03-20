# functions.sh
ahoahoahoahoahoa
# Edit 20170319

# bases variables
v_date="$(date +%Y%m%d)"
v_time="$(date +%H%M%S)"
v_backup_suffix="_${v_date}_${v_time}.backup"
v_log_file="${HOME}/tantakotan_${v_date}_${v_time}.log"

# functions
function LogInfo()
{
        echo $1 | awk '{print "'"$(date -Is)"' [INFO]: "$0}' | tee -a ${v_log_file}
}

# EOF
