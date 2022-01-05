#!/usr/bin/env bash

LOGTAG=powercontrol-client-statecheck

function logsetup {
    exec 1> >(logger -p user.debug -t $LOGTAG) 2>&1
}

function log {
    echo $*
}

logsetup

cd $(dirname $(realpath $0))

log "Reading configuration"
source ./powercontrol-client.conf
echo "powercontrol server: $powercontrol_server"

log "Querying server"
powertimestate=$(curl --silent --max-time $curl_max_time $powercontrol_server)
[ -z $powertimestate ] && powertimestate="True"
[ -z $powertimestate ] && log "No response from server. Fallback to no auto shutdown."
log "State inside frame: $powertimestate"

[ -r powercontrol-clientstate ] || ( echo "disarmed" > powercontrol-clientstate & log "No client state file. Fallback to no auto shutdown.")
clientstate=$([ -r powercontrol-clientstate ] && cat powercontrol-clientstate)
log "Client state: $clientstate"

if [ $clientstate = "armed" ] && [ $powertimestate = "False" ]
then
    [ $debug = "True" ] || ( log "Auto shutdown now." & poweroff )
    [ $debug = "True" ] && ( log "Auto shutdown in debug mode." & echo "poweroff" )
fi
