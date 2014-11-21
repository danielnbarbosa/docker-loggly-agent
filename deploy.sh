#! /bin/bash

SHA1=$1

# Deploy image to Docker Hub
#docker push danielnbarbosa/loggly-agent:$SHA1
docker push danielnbarbosa/loggly-agent

# Deploy to CoreOS cluster
ssh core@54.67.14.65 -C 'fleetctl stop loggly-agent@{1..3}.service; fleetctl start loggly-agent@{1..3}.service'
