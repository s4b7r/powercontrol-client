#!/bin/bash

source ./powercontrol-client.conf
echo "powercontrol server: $powercontrol_server"

powertimestate=$(curl --silent --max-time $curl_max_time $powercontrol_server)
[ -z $powertimestate ] && echo "No response from server. Fallback to no shutdown."
[ -z $powertimestate ] && powertimestate="True"
echo "Inside frame: $powertimestate"

[ -r powercontrol-clientstate ] || echo "disarmed" > powercontrol-clientstate
clientstate=$([ -r powercontrol-clientstate ] && cat powercontrol-clientstate)
echo "Client state: $clientstate"

if [ $clientstate = "armed" ] && [ $powertimestate = "False" ]
then
    [ $debug = "False" ] && poweroff
    [ $debug = "Flase" ] || echo "poweroff"
fi
