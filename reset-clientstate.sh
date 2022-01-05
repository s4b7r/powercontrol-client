#!/usr/bin/env bash

LOGTAG=powercontrol-client-reset

function logsetup {
    exec 1> >(logger -p user.debug -t $LOGTAG) 2>&1
}

function log {
    echo $*
}

logsetup

cd $(dirname $(realpath $0))

log "Resetting client state."
[ -r powercontrol-clientstate ] || log "No state file present."
[ -r powercontrol-clientstate ] && rm powercontrol-clientstate
