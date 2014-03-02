#!/bin/bash

ETC="./etc"
. bin/common
ENVSTR=$(load_env $ETC/common.env $ETC/user-api.env)
echo starting $NODE $0
sleep 12
export SEAGULL_SERVICE="$(describeWatch 'seagull-local')"
NODE="$NODE -d 10"
env $(echo "$ENVSTR") $NODE node_modules/user-api/lib/index.js | tee -a server.log
