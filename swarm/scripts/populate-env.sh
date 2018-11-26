#!/bin/sh -e

## TODO: Confirm that we got a single NodePort. Add retry logic if not.
##       Figure out a nicer way to get the public IP


# Get NodePort by querying the service that is labeled with pod=$POD_NAME
NODEPORT=$(kubectl get services -l "pod in (${POD_NAME}), type in (external)" -o go-template='{{range .items}}{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}')

# Get the public IP
PUBLIC_IP=$(wget http://169.254.169.254/latest/meta-data/public-ipv4 -q -O -)

echo "NODEPORT=$NODEPORT" > /env/swarm.env
echo "PUBLIC_IP=$PUBLIC_IP" >> /env/swarm.env
