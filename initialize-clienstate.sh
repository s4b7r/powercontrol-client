#!/usr/bin/env bash

LOGFILE=pwrctrl-client-initclientstate.log
# RETAIN_NUM_LINES=10

function logsetup {
    # TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && echo "${TMP}" > $LOGFILE
    exec > >(tee -a $LOGFILE)
    exec 2>&1
}

function log {
    echo "[$(date --rfc-3339=seconds)]: $*"
}

logsetup

log "Checking configured client state"
[ -r powercontrol-clientstate ] && log "State file already exists. Exiting."
[ -r powercontrol-clientstate ] && exit

log "Reading configuration"
source ./powercontrol-client.conf
log "powercontrol server: $powercontrol_server"

log "Querying server"
powertimestate=$(curl --silent --max-time $curl_max_time $powercontrol_server)
[ -z $powertimestate ] && echo "disarmed" > powercontrol-clientstate 
[ -z $powertimestate ] && log "No response from server. Fallback to disarmed and exiting."
[ -z $powertimestate ] && exit
log "State inside frame: $powertimestate"

[ $powertimestate = "True" ] && ( log "Inside frame. Arming auto shutdown." & echo "armed" > powercontrol-clientstate )
[ $powertimestate = "True" ] || ( log "Outside frame. Disarming auto shutdown." & echo "disarmed" > powercontrol-clientstate )
