#!/bin/bash

user=ally

### Input version
read -p "Input Version: " version

operator-sdk build quay.io/${user}/openshift-helloworld-operator:v0.${version}

docker push quay.io/${user}/openshift-helloworld-operator:v0.${version}
