<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> PersistentVolumeClaim Lab

> Provision a PersistentVolume and PersistentVolumeClaim for a Postgresql Database

1. Reuse your secret Postgres lab deployment!
1. Define a 5Gb PV using a hostPath based volume
1. Define a PVC requiring RW access to a 2Gb DB partition
1. Define a Postgres deployment requiring the PVC defined above
   1. Docker image: postgres:9.6.2-alpine
   1. Data dir: /var/lib/postgresql/data
   1. Port: 5432
1. Deploy your Postgres deployment
1. Verify your volume and claim are correctly bound
1. Ensure the volume is mounted correctly on your Postgres pod
1. Ensure you can access the database locally
   1. NOTE: You will need to setup a port-forward!
1. Create a new database
1. Delete and recreate your deployment
1. Check if your new database is there??
1. Delete your deployment, pv and pvc

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
  kubectl apply -f k8s/pg.yml
  ```

- Verify!

  ```shell
  kubectl get po,pv,pvc
  ```

-- Setup PortForward

  ```shell
  kubectl port-forward $(kubectl get po -l app=pg --template '{{(index .items 0).metadata.name}}') 5432
  ```

-- Check volume

  ```shell
  export POD_ID=`kubectl get po -l app=pg -o go-template='{{(index .items 0).metadata.name}}'`
  kubectl exec -it $POD_ID -- du -sh /var/lib/postgresql/data
  ```

- Create database

  ```shell
  psql -U fred -h localhost -p 5432 -c 'create database pvc_lab'
  ```

- Check database

  ```shell
  psql -U fred -W -h localhost -p 5432 -c '\l'
  ```

- Recreate deployment and verify DB

  ```shell
  kubectl delete -f k8s/pg.yml
  kubectl apply -f k8s/pg.yml
  kubectl port-forward $(kubectl get po -l app=pg --template '{{(index .items 0).metadata.name}}') 5432
  # Use \q to exit
  psql -U fred -h localhost -p 5432 pvc_lab
  ```

- Clean up!

  ```shell
  ku delete -f k8s/pg.yml
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)