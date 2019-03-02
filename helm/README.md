<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Helm Lab


> Deploy an **Iconoflix** Helm chart!

1. Install Helm
   1. [Helm Installer](https://github.com/kubernetes/helm/releases)

2. Setup Tiller...

    ```shell
    helm init --upgrade
    ```

3. Verify!

    ```shell
    # Should list out cli and tiller version
    helm version
    ```

4. Create a new Helm repo that host the iconoflix chart

    ```shell
    helm repo add iconoflix https://imhotepio.github.io/iconoflix-charts
    ```

5. Create a postgres config file using this template

    ```yaml
    image:           postgres
    imageTag:        9.6.2-alpine
    imagePullPolicy: IfNotPresent

    postgresUser:     CHANGE_ME!
    postgresPassword: CHANGE_ME!
    postgresDatabase: iconoflix

    resources:
      requests:
        cpu:    500m
        memory: 256Mi
      limits:
        cpu:    750m
        memory: 512Mi

    persistence:
      enabled:      true
      accessMode:   ReadWriteOnce
      size:         100Mi
      subPath:      postgresql-db

    metrics:
      enabled:      false
    ```

6. Find and Install the Helm stable/postgresql chart
7. Verify you can connect to the database

    ```shell
    # Note! You will need to setup a port-forward to connect to postgres!
    psql -U CHANGE_ME_MY_DB_USER -W -h localhost -p 5432 iconoflix
    ```

8. Search the Iconoflix service chart (icx-go-gql)
9. Create an Helm config for this chart using this template

    ```yaml
    service:
      type:     NodePort
      nodePort: 30400

    db:
      host:    CHANGE_ME_POSTGRES_DB_SERVICE
      port:    5432
      secret:  CHANGE_ME_POSTGRES_SECRET_NAME
      pwd_key: postgres-password
      user:    CHANGE_ME
      name:    iconoflix
    ```

10. Search for the Iconoflix UI chart (icx-ui-gql)
11. Create an Iconoflix UI helm config file using this template

    ```yaml
    api:
      url: http:\/\/CHANGE_ME_YOUR_NODE_IP:30400\/picker

    service:
      type:         NodePort
      externalPort: 30401
    ```

12. Install the Iconoflix service and UI charts
13. Validate your application is running
14. Launch your new Iconoflix ui in your browser!
15. Guess a few movies names
16. Delete your application completely!

<br/>

---
## Commands

- Configure Chart Repository

  ```shell
  helm repo add iconoflix https://imhotepio.github.io/iconoflix-charts
  ```

- Update Chart Repository

  ```shell
  helm repo update
  ```

- Deploy Postgres

  ```shell
  helm search postgres
  helm install stable/postgresql -n icx-db --replace -f k8s/pg.yml
  ```

- Verify the Database is up and running correctly

  ```shell
  kubectl get po,svc,ep
  kubectl port-forward -n default svc/icx-db-postgresql 5432 &
  # Create the iconoflix database...
  PGPASSWORD="postgres" psql -U postgres -h localhost -p 5432 -c 'create database iconoflix'
  ```

- Deploy Iconoflix api and ui


  ```shell
  helm search icx
  helm install iconoflix/icx-go-gql -n icx-go --replace -f k8s/icx-go-gql.yml
  helm install iconoflix/icx-ui-gql -n icx-ui --replace -f k8s/icx-ui-gql.yml
  ```

- Launch the ui

  ```shell
  minikube service icx-ui-gql
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2018 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)