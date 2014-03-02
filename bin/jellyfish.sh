#!/bin/bash

ETC="./etc"
. bin/common
ENVSTR=$(load_env $ETC/common.env $ETC/jellyfish.env)
echo starting $NODE $0
sleep 7
export USER_API_SERVICE="$(describeWatch user-api-local)"
export SEAGULL_SERVICE="$(describeWatch seagull-local)"
NODE="$NODE -d 8"
env $(echo "$ENVSTR") $NODE node_modules/jellyfish/app.js | cat
