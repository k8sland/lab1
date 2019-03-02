<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> PersistentVolumeClaim Lab

<br/>

---
## Manifests

+ [Postgres]({{"../pg.yml"}})

<br/>

---
## Commands

- Provision storage

  ```shell
  minikube ssh
  sudo mkdir /tmp/postgres-lab
  ```

- Deploy postgres

  ```shell
  kubectl apply -f pg.yml
  ```

- Verify!

  ```shell
  kubectl get po,pv,pvc
  ```

-- Check volume

  ```shell
  export POD_ID=`kubectl get po -l app=pg -o go-template='{{(index .items 0).metadata.name}}'`
  kubectl exec -it $POD_ID -- du -sh /var/lib/postgresql/data
  ```

- Create database

  ```shell
  psql -U fred -h $(minikube ip) -p 30543 -c 'create database pvc_lab'
  ```

- Recreate deployment and verify DB

  ```shell
  kubectl delete -f pg.yml
  kubectl apply -f pg.yml
  psql -U fred -h $(minikube ip) -p 30543 pvc_lab
  ```

- Clean up!

  ```shell
  ku delete -f pg.yml
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2018 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)