#!/usr/bin/env bash

LOGTAG=powercontrol-client-reset

function logsetup {
    exec 1> >(logger -p user.info -t $LOGTAG) 2>&1
}

function log {
    echo $*
}

logsetup

log "Resetting client state."
[ -r powercontrol-clientstate ] || log "No state file present."
[ -r powercontrol-clientstate ] && rm powercontrol-clientstate
