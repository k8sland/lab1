<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Deployment Lab

> Provision an **Iconoflix** application using deployments.

1. Create a deployment manifest
   1. Using image: quay.io/imhotepio/iconoflix:mem
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
    ```

- Create the iconoflix deployment

  ```shell
  kubectl apply -f iconoflix.yml --record
  ```

- Ensure pod is running

  ```shell
  kubectl get deploy iconoflix
  ```

- Check image version

  ```shell
  kubectl describe po -l app=iconoflix | grep -i image
  # or...
  kubectl get rs -l app=iconoflix -o wide
  ```

- Update image tag to :file...

  > NOTE: This will be usually done in the manifest!

  ```shell
  kubectl apply -f iconoflix.yml --record
  # OR...
  kubectl set image deploy/iconoflix iconoflix=quay.io/imhotepio/iconoflix:file
  ```

- Check rollout status and history

  ```shell
  kubectl rollout status deploy/iconoflix
  kubectl rollout history deploy/iconoflix
  ```

- Scale deployment to 5 instances

  ```shell
  kubectl scale --replicas=5 deploy/iconoflix
  ```

- Verify!

  ```shell
  kubectl rollout status deploy/iconoflix
  ```

- Revert back to initial deployment

  > NOTE: The rolling update ie old pod stays up until the new one is up and running!

  ```shell
  kubectl rollout undo deploy/iconoflix
  ```

- Verify!

  ```shell
  kubectl get rs -l app=iconoflix -o wide
  ```

- Delete deployment

  ```shell
  kubectl delete -f iconoflix.yml
  # OR...
  kubectl delete deploy/iconoflix
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)