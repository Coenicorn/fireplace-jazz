#!/usr/bin/bash

trap "kill 0" EXIT

./loop-fireplace.sh &
./random-jazz.sh &
wait
