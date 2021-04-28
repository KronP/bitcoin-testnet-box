#!/bin/sh
# cd bitcoin-testnet-box
mkdir tmp
cd tmp
export BITCOIN_CORE_VERSION="0.21.0"
wget "https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_CORE_VERSION}/bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz"
tar xzf "bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz"
cd "bitcoin-${BITCOIN_CORE_VERSION}/bin"
install --mode 755 --target-directory /usr/local/bin *

cd /workspace/bitcoin-testnet-box/
rm -r tmp
make start
sleep 5

bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 createwallet testwallet

make generate BLOCKS=2000

# Add money to users
bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 -named sendtoaddress address=mqRxU5gTKqzbaJvkuij3DPASxjxna1oVWR amount=50 fee_rate=25
bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 -named sendtoaddress address=mzzNHrRXQ6Ru7dWseRqBssXyKvCqbaLeW9 amount=5000 fee_rate=25
bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 -named sendtoaddress address=mkrNP5RvrfYdV2FJ1DcthfCyE1WYsaM61k amount=10 fee_rate=25