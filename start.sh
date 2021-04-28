#!/bin/sh

cd /workspace/bitcoin-testnet-box/
make start
sleep 5

bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 loadwallet testwallet


# Should this really be rerun?
make generate BLOCKS=2000

# Add money to users
bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 -named sendtoaddress address=mqRxU5gTKqzbaJvkuij3DPASxjxna1oVWR amount=50 fee_rate=25
bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 -named sendtoaddress address=mzzNHrRXQ6Ru7dWseRqBssXyKvCqbaLeW9 amount=5000 fee_rate=25

bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 -named sendtoaddress address=mkrNP5RvrfYdV2FJ1DcthfCyE1WYsaM61k amount=10 fee_rate=25