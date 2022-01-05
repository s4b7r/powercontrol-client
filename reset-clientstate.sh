#!/usr/bin/env bash

LOGTAG=powercontrol-client-reset

cd $(dirname $(realpath $0))

function logsetup {
    exec 1> >(tee -a $LOGTAG.log >(logger -p user.debug -t $LOGTAG) >/dev/null)
    exec 2>&1
}

function log {
    echo $*
}

logsetup

date

log "Resetting client state. $(date)"
[ -r powercontrol-clientstate ] || log "No state file present."
[ -r powercontrol-clientstate ] && rm powercontrol-clientstate
