<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Service Lab

> Create a service to front your **Iconoflix** application pod(s)

1. Create 2 Iconoflix pod manifests iconoflix1 and iconoflix2 (see k8s/iconoflix[1|2].yml)
    1. Using the following image: [Iconoflix](http://quay.io/imhotepio/iconoflix)
    2. Be sure to use the tag `mem`
2. Create an Iconoflix service manifest (see k8s/svc.yml)
    1. Make sure the service can be accessed locally on port 30400!
3. Provision iconoflix1 and service
4. Verify the service and pod are up and running correctly
5. Tail the pods logs
6. Hit the service URL and check your pod logs
7. Launch the iconoflix2 pod
8. Tail the new pod log
9. Once again hit the service URL a few times
10. What do you see now in the logs?
11. Delete the service and pods
12. Extra-Credit: Can you figure out another way to hit the service url from within a pod using the **service DNS name?

<br/>

---

## Commands

# Hit service URL

  ```shell
  http `minikube service iconoflix --url`
  # Or...
  curl -XGET `minikube service iconoflix --url`
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2020 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)
