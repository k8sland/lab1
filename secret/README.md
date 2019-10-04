<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Secret Lab

> Provision a **Postgres** database using secrets for the username and password.

1. Create a deployment and service for **Postgres** using the official docker image
    1. [Postgresql](https://hub.docker.com/_/postgres/)
    2. Use tag: 9.6.8-alpine
    3. Make sure your service is externally accessible
2. Create a secret that contains the db user/password
3. Leverage your secret in your deployment manifest
4. Launch your Postgres application
5. Ensure you can connect to your database locally using your secrets credentials
    1. psql -U MYUSER -W -h $(minikube ip) -p MYPORT
6. Delete your application and secrets

<br/>

---
## Commands

- [Alternate!] Create secrets manually...

  ```shell
  kubectl create secret generic pg-creds \
    --from-literal=pg_user=blee \
    --from-literal=pg_pwd=Duh!
  ```

- Verify!

  ```shell
  kubectl get secrets pg-creds
  ```

- Deploy the database

  ```shell
  kubectl apply -f pg.yml
  ```

- Verify!

   ```shell
   ku get po,svc,ep,secret -l app=pg
   ```

- Connect...

  ```shell
  psql -U fernand -W -h $(minikube ip) -p 30432
  # NOTE: \q to exit!
  ```

- Cleaning up!

  ```shell
  kubectl delete -f pg.yml
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)