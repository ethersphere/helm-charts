#!/bin/sh -xe

ARTIFACTS_DIR="artifacts"

if [ ! -d $ARTIFACTS_DIR ] ; then
  git clone git@github.com:ethersphere/helm-charts-artifacts.git $ARTIFACTS_DIR
fi

helm repo add ethersphere https://raw.githubusercontent.com/ethersphere/helm-charts-artifacts/master/
helm repo update

for chart in jaeger geth swarm swarm-private
do
  helm dependency update $chart
  helm package $chart -d $ARTIFACTS_DIR
done

helm repo index $ARTIFACTS_DIR
