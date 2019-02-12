# swarm-global-store

This chart deploys a [global-store](https://github.com/ethereum/go-ethereum/tree/master/cmd/swarm/global-store) that can be used by Swarm nodes to store their data at a central place. This is mainly useful for debugging and testing purposes. By default it will run in-memory, you can also choose to persist data to disk. See [values.yaml](values.yaml) for more details.

Swarm nodes that want to use this globalstore should run with the `--globalstore-api ` flag . E.g.: `--globalstore-api=ws://swarm-global-store:3033`
