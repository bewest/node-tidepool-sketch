#!/bin/bash
ETC="./etc"
. bin/common
ENVSTR=$(load_env $ETC/common.env $ETC/armada.env)
echo starting $NODE $0
sleep 5
export USER_API_SERVICE="$(describeWatch user-api-local)"
NODE="$NODE -d 15"
env $(echo "$ENVSTR") $NODE node_modules/group-api/lib/index.js | tee -a server.log
