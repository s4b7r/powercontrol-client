#!/bin/bash

[ -r powercontrol-clientstate ] && echo "State file already exists." & exit

source ./powercontrol-client.conf
echo "powercontrol server: $powercontrol_server"

powertimestate=$(curl --silent --max-time $curl_max_time $powercontrol_server)
[ -z $powertimestate ] && echo "No response from server. Fallback to no shutdown."
[ -z $powertimestate ] && echo "disarmed" > powercontrol-clientstate & exit
echo "Inside frame: $powertimestate"

[ $powertimestate = "True" ] && echo "armed" > powercontrol-clientstate
[ $powertimestate = "True" ] || echo "disarmed" > powercontrol-clientstate
