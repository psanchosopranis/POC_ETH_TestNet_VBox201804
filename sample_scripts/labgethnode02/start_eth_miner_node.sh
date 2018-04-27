#!/bin/bash
set -x
export CURRENT_TIME=$(date +%Y%m%d%H%M%S)
export NETID=15936
export IDENTITY="testnetnode02"
export DATADIR=$HOME/ethtestnet
export LOGSDIR=$HOME/ethtestnetlogs
export NODEPORT=30311
export RPCPORT=8501
export GASLIMIT=4700000
export GASPRICE=18000000000
export NETSTATSPASS=changeit
export CACHESIZE=512
export MAXPEERS=50
export STDOUT_LOG=${LOGSDIR}/ethnode_"${CURRENT_TIME}_1".log
export STDERR_LOG=${LOGSDIR}/ethnode_"${CURRENT_TIME}_2".log

nohup geth \
--networkid ${NETID} \
--cache ${CACHESIZE} \
--maxpeers ${MAXPEERS} \
--identity ${IDENTITY} \
--datadir ${DATADIR}/ \
--syncmode 'full' \
--port ${NODEPORT} \
--rpc --rpcapi 'admin,db,debug,eth,miner,net,personal,shh,txpool,web3' \
--rpcaddr 0.0.0.0 --rpcport ${RPCPORT} \
--bootnodes enode://d037519c2b3eaa87b46c968c86b6e5ce3e692412f8a603e737841e0e70dac3579cca3d44e3ae4229274a3fb527d9ee01628478dd64194c87c586a4b8fec20703@10.0.0.23:30310 \
--ethstats ${IDENTITY}:${NETSTATSPASS}@10.0.0.23:3000 \
--mine --minerthreads 1 \
--targetgaslimit ${GASLIMIT} \
--gasprice ${GASPRICE} \
--unlock 0 \
--password ${DATADIR}/password.txt \
--verbosity 3 \
--vmdebug \
1>> ${STDOUT_LOG} \
2>> ${STDERR_LOG} &

set +x

echo "[*] Nodo ${IDENTITY} arrancando ..."
echo "[*] Ver logs en ${STDOUT_LOG} y ${STDERR_LOG} "
echo "[*] PID: $(pgrep geth)" 
echo "usar: tail -f ${STDERR_LOG} &"
