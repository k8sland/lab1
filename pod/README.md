<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Pod Lab

> Deploy an **Iconoflix** api server using a pod.

1. Create a pod manifest for **Iconoflix** (see k8s/iconoflix.yml)
    1. Docker image: [Iconoflix](https://quay.io/repository/imhotepio/iconoflix)
    2. Use image tag: **mem**
2. Make sure to read the Iconoflix Docker image documentation!
3. Launch your pod
4. Ensure the pod is up and running
5. Check image version
6. Tail the pod logs
7. SSH into the running pod and hit the service url
    1. You should see your request in the logs
8. Change Docker image tag to use **file** instead of **mem** and redeploy your pod
9. Verify the pod is running and the image has been updated
10. Delete your pod

> EXTRA-CREDIT: Can you figure out another way to hit the Iconoflix url?

<br/>

---

# Commands

## Hit the nginx service URL

```shell
kubectl exec -it iconoflix -- bash
wget -qO- http://localhost:4000/
```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)