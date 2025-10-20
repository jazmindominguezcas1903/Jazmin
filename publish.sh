#!/usr/bin/env bash
set -e
echo "Compiling package..."
sui move build
echo "Publishing package to testnet (use configured sui client/account)..."
sui client publish --path . --gas-budget 30000000
