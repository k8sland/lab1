<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> PersistentVolumeClaim Lab

> Provision a PersistentVolume and PersistentVolumeClaim for a Postgresql Database

1. Reuse your secret Postgres lab deployment!
2. Define a 5Gb PV using a hostPath based volume
3. Define a PVC requiring RW access to a 2Gb DB partition
4. Define a Postgres deployment requiring the PVC defined above
   1. Docker image: postgres:9.6.2-alpine
   2. Data dir: /var/lib/postgresql/data
5. Deploy your Postgres deployment
6. Verify your volume and claim are correctly bound
7. Ensure the volume is mounted correctly on your Postgres pod
8. Ensure you can access the database locally
    1. psql -U user -W -h $(minikube ip) -p port
9. Create a new database
10. Delete and recreate your deployment
11. Check if your new database is there??
12. Delete your deployment, pv and pvc

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
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)