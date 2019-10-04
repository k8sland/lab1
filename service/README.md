<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Service Lab

> Create a service to front your **Iconoflix** application pod(s)

1. Create 2 Iconoflix pod manifest iconoflix1 and iconoflix2
    1. Docker Image: quay.io/imhotepio/iconoflix:mem
1. Create an Iconoflix service manifest.
    1. Make sure the service can be accessed locally on port 30400!
1. Provision iconoflix1 and service
1. Verify the service and pod are up and running correctly
1. Tail the pods logs
1. Hit the service URL and check your pod logs
1. Launch the iconoflix2 pod
1. Tail the new pod log
1. Once again hit the service URL a few times
1. What do you see now in the logs?
1. Delete the service and pods
1. Extra-Credit: Can you figure out another way to hit the service url from within a pod using the **service DNS name?

<br/>

---
## Commands

- Deploy your service

  ```shell
  kubectl apply -f iconoflix.yaml
  ```

- Ensure the service and pods are up and running

  ```shell
  kubectl get po,svc,ep
  ```

- Tail the pod logs

  ```shell
  kubectl logs -f iconoflix1
  kubectl logs -f iconoflix2
  ```

# Hit service URL

  ```shell
  http `minikube service iconoflix --url`
  # Or...
  curl -XGET `minikube service iconoflix --url`
  ```

# Delete

  ```shell
  kubectl delete po,svc -l app=iconoflix
  # better if all in file or dir...
  kubectl delete -f iconoflix.yml
  ```

# Verify!

  ```shell
  kubectl get deploy,svc -l app=iconoflix
  ```

# Extra-Credit: DNS

  ```shell
  kubectl exec -it iconoflix1 -- wget -qO- http://iconoflix:4000
  kubectl exec -it iconoflix1 -- wget -qO- http://iconoflix.default.svc.cluster.local:4000
  kubectl exec -it iconoflix1 -- wget -qO- "http://iconoflix:4000/graphiql?query={movies{name}}"
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)
