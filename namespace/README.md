<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Namespace Lab

> Create a namespace with quotas for your iconoflix application

1. Create the following Kubernetes resources (see k8s/iconoflix.yml):
    1. A namespace named **icx**
    2. A namespace quota restricting to only **one** pod
    3. 2 Iconoflix pods namely iconoflix1 and iconoflix2 using the following specification:
        1. Docker image: [Iconoflix](https://quay.io/repository/imhotepio/iconoflix)
        2. Use image tag: **mem**
2. Deploy your application
3. Ensure only one pod is up and running
4. Check your namespace quota and make sure the used/hard match
5. Increase your namespace quota to allow more than one pod
6. Redeploy your application
7. Ensure you now have 2 pods up and running
8. Delete your namespace
9. Ensure the Iconoflix pods are terminated!

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2020 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)