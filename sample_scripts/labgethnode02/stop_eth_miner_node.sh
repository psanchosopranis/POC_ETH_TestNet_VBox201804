#!/bin/bash
export IDENTITY="testnetnode02"
export CURRENT_TIME=$(date +%Y%m%d%H%M%S)
echo "[*] Deteniendo Nodo ${IDENTITY}  ..."
echo "[*] PID: $(pgrep geth)" 
set -x
pkill --full --echo --signal SIGTERM geth
set +x
