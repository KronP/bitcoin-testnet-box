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

bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 createwallet testwallet

make generate BLOCKS=250

# Add money to users
bitcoin-cli -rpcport=19001 -rpcpassword=123 -rpcuser=admin1 -named sendtoaddress address=mqRxU5gTKqzbaJvkuij3DPASxjxna1oVWR amount=50 fee_rate=25
