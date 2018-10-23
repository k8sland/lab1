# Probes Lab

![docker hub](https://img.shields.io/docker/pulls/imhotepio/learnk8s-java.svg?style=flat-square)
![docker hub](https://img.shields.io/docker/stars/imhotepio/learnk8s-java.svg?style=flat-square)
![docker hub](https://img.shields.io/docker/build/imhotepio/learnk8s-java.svg?style=flat-square)
![docker hub](https://img.shields.io/docker/automated/imhotepio/learnk8s-java.svg?style=flat-square)

<br/>
A sample Spring Boot demo application to illustrate java based deployments with Kubernetes

---
## Prerequisites

- Java8+
- Maven
- Docker

## Setup

1. Build Jar file, Docker image and publish it!

    ```shell
    make push
    ```

2. Provision the application

    ```shell
    kubectl apply -f k8s/hello.yml
    ```

3. Verify!

    ```shell
    curl -XGET http://$(minikube ip):30800/hello
    ```

---
<img src="../assets/imhoteplogo.png" width="32" height="auto"/> © 2018 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)