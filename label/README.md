<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Label Lab

> Provision an **Iconoflix** application only on nodes that have an ssd drive

1. Create a manifest for the **Iconoflix** program (see k8s/iconoflix.yml)
    1. Use Docker Image: quay.io/imhotepio/iconoflix:mem
    2. Specify a nodeSelector *disk=ssd*
2. Deploy your application
3. What's happening to your pod?
4. How can you tell what's going on?
5. Now label your node accordingly
6. Ensure the node is correctly labeled
7. Do you see what's happening with your pod now?
8. Next delete your node label
9. What's happening to your pod?
10. Delete your iconoflix pod

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2020 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)