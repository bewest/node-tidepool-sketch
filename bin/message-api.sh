#!/bin/bash

ETC="./etc"
. bin/common
ENVSTR=$(load_env $ETC/common.env $ETC/message-api.env)
echo starting $NODE $0
sleep 10
export USER_API_SERVICE="$(describeWatch user-api-local)"
NODE="$NODE -d 15"
env $(echo "$ENVSTR") $NODE  node_modules/message-api/lib/index.js | tee -a server.log
