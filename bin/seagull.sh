#!/bin/bash

ETC="./etc"
. bin/common
ENVSTR=$(load_env $ETC/common.env $ETC/seagull.env)
echo starting $NODE $0
sleep 7
export USER_API_SERVICE="$(describeWatch user-api-local)"
env $(echo "$ENVSTR") $NODE -d 10 node_modules/seagull/lib/index.js | tee -a server.log
