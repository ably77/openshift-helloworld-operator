#!/bin/bash

oc new-project helloworld-operator

oc create -f deploy/crds/hello_v1alpha1_helloworld_crd.yaml

oc create -f deploy/operator.yaml \
          -f deploy/role_binding.yaml \
          -f deploy/role.yaml \
          -f deploy/service_account.yaml

oc create -f deploy/role_user.yaml 
oc adm policy add-cluster-role-to-user helloworld-operator-execute kubeadmin

#oc create -n helloworld-operator -f deploy/crds/hello_v1alpha1_helloworld_cr.yaml

