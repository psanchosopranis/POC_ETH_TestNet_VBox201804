#!/bin/bash
export CURRENT_TIME=$(date +%Y%m%d%H%M%S)
export LISTEN_PORT=30310
export BOOTNODE_HOME=/home/devel1/ethtestnet/bootnode
export BOOTKEY_PATH=${BOOTNODE_HOME}/boot.key
bootnode -nodekey ${BOOTKEY_PATH} -verbosity 9 -addr :${LISTEN_PORT} 1>> ${BOOTNODE_HOME}/logs/bootnode_"${CURRENT_TIME}".log  2>> ${BOOTNODE_HOME}/logs/bootnode_"${CURRENT_TIME}".error
