# oke-ceph

After you created the OKE cluster, follow the steps below for deploying Rook/Ceph.

**Deploy the Rook Operator**

```sh
git clone --single-branch --branch v1.8.2 https://github.com/rook/rook.git
```

```sh
cd rook/deploy/examples

kubectl create -f crds.yaml -f common.yaml -f https://raw.githubusercontent.com/OguzPastirmaci/oke-ceph/main/ceph/operator.yaml
```

**Verify the rook-ceph-operator is in the `Running` state before proceeding**
```
kubectl -n rook-ceph get pod
```

**Create a Ceph Cluster**

```
kubectl create -f https://raw.githubusercontent.com/OguzPastirmaci/oke-ceph/main/ceph/cluster.yaml
```

**Wait for all pods to be running in the rook-ceph namespace**
```
kubectl -n rook-ceph get pod
```

**Launch the rook-ceph-tools pod**
```
kubectl create -f toolbox.yaml
```

**Connect to to toolbox**
```
kubectl -n rook-ceph exec -it deploy/rook-ceph-tools -- bash
```

**Check cluster help from the Toolbox**
```
ceph status
```

**Create Ceph block storage**

Follow the instructions for creating a Ceph block storage and test mounting it to pods:
https://rook.io/docs/rook/v1.8/ceph-block.html

