#!/bin/bash

ETC="./etc"
. bin/common
ENVSTR=$(load_env $ETC/common.env $ETC/pool-whisperer.env)
echo starting $NODE $0
sleep 9
export USER_API_SERVICE="$(describeWatch user-api-local)"
export SEAGULL_SERVICE="$(describeWatch seagull-local)"
NODE="$NODE -d 15"
env $(echo "$ENVSTR") $NODE node_modules/pool-whisperer/server.js | tee -a server.log
