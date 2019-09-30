#!/bin/bash

oc delete project helloworld-operator
oc delete -f deploy/role_binding.yaml
oc delete -f deploy/role.yaml
