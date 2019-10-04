<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> CronJob Lab

> Create a CronJob to update Iconoflix movies list every minute.

1. Define your *Iconoflix* deployment and deploy it.
   Image: quay.io/imhotep/iconoflix:db
2. Define your *Postgres* deployment and deploy it
   Image: postgres:9.6.2-alpine
3. Check out your current movie list

   ```shell
   curl -G -XGET `minikube service iconoflix --url`/graphql -d query='{movies{name}}'
    ```

4. Define your *CronJob* manifest
   Image: odise/busybox-curl:latest
   Use this curl command to add a movie. Substitute XX:YY with Iconoflix host/port

   ```shell
   curl -XPOST \
    -H "Content-Type: application/graphql" \
    http://XXXX:YYYY/graphql \
    -d 'mutation RootMutationType {createMovie(movie: {name: "Home Alone", icons: ["home", "user"]}){name, icons}}'
   ```

5. Crontab expression for running every minute is: */1 * * * *
6. Deploy your CronJob
7. Ensure the job is run successfully every minute!
8. Ensure your new movies have been added!

   ```shell
   curl -G -XGET `minikube service iconoflix --url`/graphql -d query='{movies{name}}'
    ```

9. Delete your Cronjob and Job!
10. Delete your Postgres and Iconoflix deployments


<br/>

---
## Commands

- Deploy Postgres

  ```shell
  kubectl apply -f pg.yml
  ```

- Deploy Iconoflix

  ```shell
  kubectl apply -f iconoflix.yml
  ```

- Bonus! Verify update URL using Busybox

  ```shell
  kubectl run -it bb --image odise/busybox-curl --generator=run-pod/v1
  curl -XPOST \
    -H "Content-Type: application/graphql" \
    http://${ICONOFLIX_SERVICE_HOST}:${ICONOFLIX_SERVICE_PORT}/graphql \
    -d 'mutation RootMutationType {createMovie(movie: {name: "Home Alone1", icons: ["home", "user"]}){name, icons}}'; \
    echo
  ```

- Deploy Cronjob

  ```shell
  kubectl apply -f cron.yml
  ```

- Ensure CronJob is running correctly

  ```shell
  kubectl get cronjobs,jobs
  kubectl get job --watch
  ```

- Verify a new movie was indeed added

  ```shell
  http POST `minikube service iconoflix --url`/graphql query=='{movies{name}}'
  # or...
  curl -G -XGET `minikube service iconoflix --url`/graphql -d query='{movies{name}}'
  ```

- Delete cronjob

  ```shell
  kubectl delete cronjob updater
  # or...
  kubectl delete -f cron.yml
  ```

- Delete jobs

  ```shell
  kubectl delete job --all
  ```

- Delete Db and Iconoflix

  ```shell
  kubectl delete -f iconoflix.yml -f pg.yml
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)