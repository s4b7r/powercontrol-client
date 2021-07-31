#!/bin/bash

[ -r powercontrol-clientstate ] && rm powercontrol-clientstate
[ -r powercontrol-clientstate ] || echo "No state file."
