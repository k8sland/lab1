<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Volume Lab

> Deploy your **Iconoflix** application using a movies file mounted from a Github repository.

- Image repository: quay.io/imhotepio/iconoflix:file
- Github URL:      https://github.com/imhotepio/iconoflix-movies.git
- NOTE: The iconoflix application will look for movies located in the following
  directory: /var/iconoflix/movies.txt. If that file exists, movies will be loaded
  from the file, if not a default movie list will be loaded!

1. Create a deployment and service manifest to mount a volume
   using /var/iconoflix as a mount point.
2. Deploy your application
3. Verify the application is up and running and the volume is mounted!
   1. You will need to shell-in to make sure the volume is mounted and the data is correct!
4. Bring up graphiQL and make sure the movie Home Alone is listed
   1. Launch graphiQL:
      ```shell
      open $(minikube service iconoflix --url)/graphiql
      ```
   2. GraphQL query: {movies{name icons}} (Left pane!)


<br/>

---
## Commands

- Deploy the application

  ```shell
  kubectl apply -f iconoflix.yml
  ```

- Verify!

  ```shell
  kubectl get po iconoflix
  kubectl get ep
  kubectl get po -l app=iconoflix -o yaml
  export POD_NAME=`kubectl get po -l app=iconoflix -o go-template='{{(index .items 0).metadata.name}}'`
  kubectl exec -it $POD_NAME -- cat /var/iconoflix/movies.txt
  ```

- Check Home Alone is in the movie list

  ```shell
  open `minikube service iconoflix --url`/graphiql
  # Left pane enter {movies{name icons}} and hit run
  # Or...
  http $(minikube service iconoflix --url)/graphql query=={movies{name}}
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2020 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)
