# openshift-helloworld-operator

## Modify ansible playbooks
Once completed with modifying any /roles/helloworld/tasks move on to building your operator

## Building your Operator image

First build locally:
```
user=<quay_username>
operator-sdk build quay.io/${user}/openshift-helloworld-operator:v0.1
```

Push to quay.io:
```
docker push quay.io/${user}/openshift-helloworld-operator:v0.1
```

Modify your deploy/operator.yaml to match your Operator image:tag
```
<...>
spec:
      serviceAccountName: helloworld-operator
      containers:
        - name: helloworld-operator
          # Replace this with the built image name
          image: quay.io/ally/openshift-helloworld-operator:v0.1
          imagePullPolicy: Always
<...>
```

## Install the Operator
```
./runme.sh
```

## Watch your Installation
```
oc get pods -w
```

## Operator Functions

To manipulate your CR
```
oc edit Helloworld/hello-openshift

or

oc edit -f deploy/crds/hello_v1alpha1_helloworld_cr.yaml
```

### Variables to Manipulate
```
size: # of hello-world replicas in the deployment
state: present/absent
```

## Uninstalling
```
oc delete project helloworld-operator
```
