#!/bin/sh
cd /home/tester/bitcoin-testnet-box
make start
bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 createwallet testwallet
make generate BLOCK=200
