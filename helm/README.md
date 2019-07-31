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

5. Update the k8s/pg.yml and set the image (9.6.2-alpine) and db credentials
6. Find and Install the Helm stable/postgresql chart
7. Verify you can connect to the databases
8. Search the Iconoflix service chart (icx-go-gql)
9. Update the Helm config for this icx-go-gql chart using k8s/icx-go-gql.yml
10. Search for the Iconoflix UI chart (icx-ui-gql)
11. Update the Iconoflix UI helm config file in k8s/icx-ui-gql.yml
12. Install the Iconoflix service and UI charts
13. Validate your application is running
14. Launch your new Iconoflix ui in your browser!
15. Have some fun and guess a few movies names
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
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)