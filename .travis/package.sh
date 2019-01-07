#!/bin/sh -xe

ARTIFACTS_DIR="artifacts"
CHART_REPO_URL="https://raw.githubusercontent.com/ethersphere/helm-charts-artifacts/master/"

if [ ! -d $ARTIFACTS_DIR ] ; then
  git clone git@github.com:ethersphere/helm-charts-artifacts.git $ARTIFACTS_DIR
fi

helm repo add ethersphere $CHART_REPO_URL
helm repo update

for chart in */Chart.yaml
do
  chart=$(dirname "$chart")
  helm dependency update "$chart"
  helm package "$chart" -d "$ARTIFACTS_DIR"
done

helm repo index --url "$CHART_REPO_URL" --merge "$ARTIFACTS_DIR/index.yaml" "$ARTIFACTS_DIR"
