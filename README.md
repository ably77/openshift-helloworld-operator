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
