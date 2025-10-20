#!/usr/bin/env bash
set -e
PACKAGE_ID="0xYOUR_PACKAGE_ID"
echo "Calling mint on package $PACKAGE_ID ..."
sui client call --package $PACKAGE_ID --module basic_nft --function mint --args '["Demo NFT", "https://example.com/nft.png"]' --gas-budget 20000000
