<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Probes Lab

> Add Readiness/Liveliness probes to an Iconoflix application

1. In the given Iconoflix deployment (k8s/iconoflix.yml) add a HTTP Readiness probe
   1. Use /check/alive
1. Monitor your endpoints
   1. kubectl get ep --watch
1. What do you see?
1. Now redeploy your Iconoflix pod but with a Readiness delay to 20s
1. What do you notice in your Iconoflix endpoint?
1. Next define a HTTP Liveliness probe on the Iconoflix container
   1. /check/health
1. Watch the Iconoflix pod logs
1. What do you notice?
1. Delete your application

<br/>

---
## <img src="../assets/fox.png" width="32" height="auto"/> Commands

- Watching endpoints

  ```shell
  kubectl get ep --watch
  ```

- Check probes are working

  ```shell
  kubectl logs -f `kubectl get po -l app=iconoflix -o go-template='{{(index .items 0).metadata.name}}'`
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2021 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)