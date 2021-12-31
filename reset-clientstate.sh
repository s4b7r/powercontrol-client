#!/usr/bin/env bash

LOGFILE=pwrctrl-client-resetclientstate.log
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

log "Resetting client state."
[ -r powercontrol-clientstate ] || log "No state file present."
[ -r powercontrol-clientstate ] && rm powercontrol-clientstate
