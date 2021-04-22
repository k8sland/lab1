<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Secret Lab

> Provision a **Postgres** database using secrets for the username and password.

1. Create a deployment and service for **Postgres** using the official docker image
    1. [Postgresql](https://hub.docker.com/_/postgres/)
    2. Use tag: 9.6.8-alpine
    3. Make sure your service is externally accessible
2. Create a secret that contains the db user/password.
3. Leverage your secret in your deployment manifest
4. Launch your Postgres application
5. Ensure you can connect to your database locally using your secrets credentials
    1. psql -U MYUSER -W -h localhost -p MYPORT
6. Delete your application and secrets!

<br/>

---

## Commands

- Verify!

   ```shell
   ku get po,svc,ep,secret -l app=pg
   ```

- Connect...

  ```shell
  psql -U fernand -W -h localhost -p 5432
  # NOTE: \q to exit!
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2020 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)