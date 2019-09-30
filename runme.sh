#!/bin/bash

oc new-project helloworld-operator

oc create -f deploy/crds/hello_v1alpha1_helloworld_crd.yaml

oc create -f deploy/operator.yaml \
          -f deploy/role_binding.yaml \
          -f deploy/role.yaml \
          -f deploy/service_account.yaml

./check-pod-status.sh helloworld-operator helloworld-operator

oc create -n helloworld-operator -f deploy/crds/cr1.yaml
oc create -n helloworld-operator -f deploy/crds/cr2.yaml
oc create -n helloworld-operator -f deploy/crds/cr3.yaml
