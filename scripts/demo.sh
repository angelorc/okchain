#!/bin/bash

# Create Test (TTT) token ttt-b4a
okchaincli tx token issue --whole-name test --symbol ttt --mintable --total-supply 20 --from validator -b block --fees 0.002tokt -y

# Query created token
okchaincli query token info ttt-b4a

# Create DEX Operator
okchaincli tx dex register-operator --from validator -b block --fees 0.002tokt  -y

# List TTT/TOKT
okchaincli tx dex list --base-asset tokt --quote-asset ttt-b4a --from validator -b block --fees 0.002tokt  -y

# CREATE BUY ORDER
okchaincli tx order new --product tokt_ttt-b4a --side BUY --quantity 1 --price 0.01 -b block --from validator --fees 0.002tokt  -y

# QUERY ORDER BOOK
okchaincli query order depthbook tokt_ttt-b4a

# CREATE SELL ORDER
okchaincli tx order new --product tokt_ttt-b4a --side SELL --quantity 0.1 --price 0.01 -b block --from validator --fees 0.002tokt  -y

# QUERY ORDER BOOK
okchaincli query order depthbook tokt_ttt-b4a
