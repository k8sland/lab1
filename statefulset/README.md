<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> StatefulSet Lab

> Deploy an **Inspect** Application using StatefulSets.

1. Update the provided Inspect StatefulSet + Service manifests: use 5 replicas
1. Deploy your inspect StatefulSet
1. Ensure the set is up and running correctly ie 5 instances
1. Ensure you can query any of the pods in the set. See Commands below...
1. Delete inspect-4
1. Ensure the pod is back up and the host is preserved
1. Scale up the cluster to 6 replicas
1. Ensure all pods are up and running
1. Now scale down to one pod
1. Ensure there is only one pod running
1. Delete the last pod and ensure it comes back with the same name!
1. Delete your application!

<br/>

---
## <img src="../assets/fox.png" width="32" height="auto"/> Commands

- Ensure set is running correctly

  ```shell
  kubectl get sts inspect
  ```

- Check Endpoints

  ! Note yous must access pods individually now

  ```shell
  kubectl exec -it inspect-0 -- wget -qO - http://inspect-2.inspect.default.svc.cluster.local:4000/
  # Or...
  kubectl exec -it inspect-0 -- wget -qO - http://inspect-2.inspect:4000/
  ```

- Ensure the pod is back up and the host is preserved

  ```shell
  kubectl exec -it inspect-1 -- printenv | grep HOSTNAME
  ```

- Scale up the cluster by adding one more replica

  ```shell
  kubectl scale sts inspect --replicas=6
  ```

- Ensure all pods are up and running

  ```shell
  kubectl get pod,ep
  ```

- Now scale down to one pod

  ```shell
  kubectl scale sts inspect --replicas=1
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)
