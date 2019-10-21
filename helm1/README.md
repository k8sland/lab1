<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Helm Lab

> Deploy a Dictionary Service as a Chart

1. Install helm and deploy Tiller on your cluster
1. Create a new dictionary chart
1. Define a deployment and a service
1. Define a custom annotation helper to annotate your deployment
   1. Define a new annotation called app
1. Validate your chart and helper using a dry run install
1. Install your unpackaged chart and verify the deployment and probes are working
1. Package your dictionary chart
1. Create a private github repo and checkin your new chart tarball and index file
1. Expose your new github repo as a [github page](https://help.github.com/en/articles/configuring-a-publishing-source-for-github-pages)
1. Deploy your dictionary chart from your custom repo
1. Verify your new charts works correctly
1. Bonus: Exchange a classmate github page url and provision it as a chart repo
   1. Deploy your classmate chart into your cluster!

<br/>

---

## Installation

1. Install [Helm](https://github.com/helm/helm/blob/master/docs/install.md)
      1. Install Helm

         ```shell
         brew install kubernetes-helm
         # Install configs + tiller on your cluster (insecure!)
         ```

      2. Modify Tiller (K8s 1.16!)

         ```shell
         helm init --output yaml > /tmp/tiller.yml
         # Edit the manifest
          1. Change extensions/v1beta1 -> apps/v1
          2. Add spec.selector as follows
         ```

         ```yaml
         spec:
           selector:
             matchLabels:
               app: helm
               name: tiller
         ```

      3. Now deploy tiller

         ```shell
         kubectl apply -f /tmp/tiller.yml
         # Verify
         kubectl get po -n kube-system -l app=helm
         ```

<br/>

---

## Commands

- Create a dictionary chart

  ```shell
  helm create dictionary
  # Verify
  helm lint dictionary
  ```

- Debug a chart

  ```shell
  helm install --dry-run --debug -n hm dictionary -f cust.yml
  ```

- Provision a chart

  ```shell
  helm install -n hm dictionary -f cust.yml
  ```

- Verify

  ```shell
  # Locate your dictionary pods
  kubectl get po -l app.kubernetes.io/name=dictionary
  # Exec into on of the 2 pods
  kubectl exec -it MY_DICTIONARY_POD_ID -- wget -qO- http://localhost:4000/api/v1/words
  ```

- Package your chart

  ```shell
  helm package dictionary
  ```

- Create a chart index

  > NOTE: You will need to create a vlab_chart git repo and expose it to
  > public internet using github pages feature.

  ```shell
  # Create a new directory and generate your packaged dictionary chart
  mkdir vlab-charts
  helm package YOUR_DICTIONARY_CHART_PATH
  # Verify your dictionary-0.1.0.tgz exists!
  # Create an index using your git page URL and dictionary chart location
  helm repo index --url MY_GIT_PAGES_REPO_URL .
  # For example using k8sland page URL...
  helm repo index --url https://k8sland.github.io/vlab-charts .
  # Verify an index.yaml file was created and has the correct content!
  # Checkin your package chart and index files
  git add . && git commit -m 'Initial drop' && git push
  ```

- Add your custom dictionary chart repo

  ```shell
  helm repo add vlab-charts MY_GIT_PAGES_REPO_URL
  # For example...
  helm repo add vlab-charts https://k8sland.github.io/vlab-charts
  # Verify!
  helm repo list
  ```

- Pull your remote charts locally

  ```shell
  helm repo update
  ```

- Locate your remote chart

  ```shell
  helm search dictionary
  ```

  ```text
  NAME                    CHART VERSION   APP VERSION     DESCRIPTION
  local/dictionary        0.1.0           1.0             A Dictionary chart for Kubernetes
  vlab-charts/dictionary  0.1.0           1.0             A Dictionary chart for Kubernetes
  ```

- Deploy your packaged chart

  ```shell
  helm upgrade hm vlab-charts/dictionary -f cust.yml
  ```

- Delete a chart

    ```shell
    helm delete hm --purge
    ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2018 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)
