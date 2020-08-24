#!/bin/sh -xe

ARTIFACTS_DIR="artifacts"
CHART_REPO_URL="https://raw.githubusercontent.com/ethersphere/helm-charts-artifacts/master/"

if [ ! -d $ARTIFACTS_DIR ] ; then
  git clone git@github.com:ethersphere/helm-charts-artifacts.git $ARTIFACTS_DIR
fi

helm repo add ethersphere $CHART_REPO_URL
helm repo add influxdata https://helm.influxdata.com/
helm repo update

# Package each chart
for chart in */Chart.yaml
do
  chart=$(dirname "$chart")
  helm dependency update "$chart"
  helm package "$chart" -d "$ARTIFACTS_DIR"
done

# Merge helm index if it already exists
if [ -f "$ARTIFACTS_DIR/index.yaml" ]; then
  helm repo index --url "$CHART_REPO_URL" --merge "$ARTIFACTS_DIR/index.yaml" "$ARTIFACTS_DIR"
else
  helm repo index --url "$CHART_REPO_URL" "$ARTIFACTS_DIR"
fi
