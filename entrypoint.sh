#!/bin/sh
cd /home/tester/bitcoin-testnet-box
make start
bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 createwallet testwallet
make generate BLOCKS=200
/bin/bash
/bin/sh -c "while sleep 1000; do :; done"