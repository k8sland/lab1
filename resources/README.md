<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Resources Lab

> Experiment with resource constraints for an Iconoflix application

1. Edit the resource section in the provided manifest (k8s/iconoflix.yml) and
   initially swag the Iconoflix container quotas
1. Deploy the application
1. Ensure everything is up and running!
1. Hit the Iconoflix API using the provided burst.sh script and monitor
   the node and pod resource
1. Tune your resources based on your findings
1. Change your cpu request to more than available and redeploy your application
   > REMINDER: Node allocations 4 cores / 8Gb mem
1. What do you notice?
1. Delete your application

<br/>

---
## <img src="../assets/fox.png" width="32" height="auto"/> Commands

- Simulate load

    ```shell
    ./burst.sh
    ```

- Monitor load

  ```shell
  watch kubectl top po
  ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2018 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)