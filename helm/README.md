<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Helm Lab

> Deploy an **Iconoflix** Helm chart!

1. Install Helm
   1. [Helm Installer](https://github.com/kubernetes/helm/releases)
2. Configure your repo to use the [stable](https://kubernetes-charts.storage.googleapis.com) chart repo
3. Verify your helm setup (version and repo)
4. Create a new Helm repo that host the [iconoflix charts](https://imhotepio.github.io/iconoflix-charts)
5. Ensure your repos are up to date!
6. Change the values file `k8s/pg.yml` - set the image (9.6.2-alpine) and your database credentials
7. Find and Install the Helm stable/postgresql chart
8. Verify you can connect to the databases
9. Locate the Iconoflix service chart (icx-go-gql)
10. In your `k8s/icx-go-gql.yml` values file specify your database credentials
11. Search for the Iconoflix UI chart (icx-ui-gql)
12. In your `k8s/icx-ui-gql.yml` specify your cluster IP
13. Install the Iconoflix service and UI charts
14. Validate your entire application is running
15. Launch your new Iconoflix ui in your browser!
16. Have some fun and guess a few movies names
17. Delete your entire application!

<br/>

---

## Commands

- Install OSX otherwise [see installation](https://helm.sh/docs/intro/install)

  ```shell
  brew install helm
  # Verify!
  helm version
  ```

- Configure Chart Repositories

  ```shell
  helm repo add stable https://kubernetes-charts.storage.googleapis.com
  helm repo add iconoflix https://imhotepio.github.io/iconoflix-charts
  # Verify!
  helm repo list
  ```

- Update Chart Repository

  ```shell
  helm repo update
  ```

- Deploy Postgres

  ```shell
  helm search postgres
  helm install icx-db stable/postgresql --replace -f k8s/pg.yml
  ```

- Verify the Database is up and running correctly

  ```shell
  kubectl get po,svc,ep
  kubectl port-forward -n default svc/icx-db-postgresql 5432 &
  # Verify the iconoflix database exists...
  PGPASSWORD="postgres" psql -U postgres -h localhost -p 5432 -c '\l'
  ```

- Deploy Iconoflix api and ui

  ```shell
  helm search repo icx
  helm install icx-go iconoflix/icx-go-gql -f k8s/icx-go-gql.yml
  helm install icx-ui iconoflix/icx-ui-gql -f k8s/icx-ui-gql.yml
  ```

- Launch the ui

  ```shell
  minikube service icx-ui-gql
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)