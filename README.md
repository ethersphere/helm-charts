# Swarm Helm Charts

[![Build Status](https://travis-ci.org/ethersphere/helm-charts.svg?branch=master)](https://travis-ci.org/ethersphere/helm-charts)


This repo contains Helm Charts for running a [Swarm](http://swarm.ethereum.org) cluster (public or private) with ENS resolution through a private Geth node.  For more information about installing and using Helm, see its
[README.md](https://github.com/helm/helm/tree/master/README.md). To get a quick introduction to Charts see this [chart document](https://github.com/helm/helm/blob/master/docs/charts.md).

## Enabling our Helm repository

First you have to add our Helm repository like this:

```sh
$ helm repo add ethersphere https://raw.githubusercontent.com/ethersphere/helm-charts-artifacts/master/
```

Now You can run `helm search ethersphere` to see the charts.

Note that new versions might become available and you'll have to fetch these by doing `helm repo update`.
