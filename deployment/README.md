<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Deployment Lab

> Provision an **Iconoflix** application using deployments.

1. Create a deployment named *iconoflix* (see k8s/iconoflix.yml)
   1. Using image: [Iconoflix](https://quay.io/repository/imhotepio/iconoflix)
   2. Use the tag `mem`
   3. Use label selector `app=iconoflix`
2. Launch your deployment
3. Ensure the deployment is up and running and image is using the correct tag
4. Now update the Iconoflix docker image to use tag **:file**
5. Make sure the deployment is running and the image has been updated
6. Next scale up the deployment to 5 instances
7. Check rollout status and history
8. Rollback your deployment to initial tag version **:mem**
9. Check rollout status and make sure it completes
10. Verify the pod is running the correct image
11. Delete your entire application

<br/>

---

## Commands

> NOTE You can observe the ReplicaSet thru out the lab using the following cmd

    ```shell
    kubectl get rs -o wide --watch
    # or if you've installed watch on OSX...
    watch kubectl get rs -o wide
    ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2020 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)