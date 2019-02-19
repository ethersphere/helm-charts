#!/bin/sh
set -xe

VERSION="${VERSION:-master}"

apk add --update git gcc g++ linux-headers

mkdir -p "$GOPATH/src/github.com/ethereum"
cd "$GOPATH/src/github.com/ethereum"
git clone https://github.com/ethersphere/go-ethereum
cd "$GOPATH/src/github.com/ethereum/go-ethereum"
git checkout "$VERSION"

$@
