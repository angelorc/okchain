#!/bin/bash

rm -rf ~/.okchaind*

#okchaincli config chain-id oklocal
#okchaincli config output json
#okchaincli config indent true
#okchaincli config trust-node true

okchaind init testval --chain-id oklocal
#okchaincli keys add validator
okchaind add-genesis-account validator 1000000000tokt
okchaind gentx --name validator
okchaind collect-gentxs
okchaind start
