#!/bin/bash

oc delete project helloworld-operator

oc delete -f deploy/role_binding.yaml \
          -f deploy/role.yaml \
          -f deploy/crds/hello_v1alpha1_helloworld_crd.yaml \
          -f storage/aws \
          -f storage/minishift
