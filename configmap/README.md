<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> ConfigMap Lab

> Let's play **Hangman**! Provision a hangman app using configmap to load the dictionary data.

1. Create a configmap for the dictionary words. (Note: There are 2 ways to do this)
    1. The file must contain words on separate lines!
2. Create a deployment and service manifest
    1. Use docker image: quay.io/imhotepio/hangman-svc-go:0.0.1
    2. The Hangman service loads dictionary data using options --dir and --file where:
        1. --dir specifies the name of the directory to load the dictionary data from (default: assets)
        2. --file specifies the name of the dictionary text file minus the **.txt** extension (default: standard)
        3. Thus if you want to load a dictionary located in /var/hangman/custom.txt you will specify:
            1. --dir /var/hangman
            2. --file custom
3. Create a service manifest for your deployment named **hangman**
4. Provision your deployment and service
5. To play the game, you will need to launch the hangman CLI:
    1. Use the following command for the one off launch

       ```shell
        kubectl run -i --tty --rm hm \
          --generator=run-pod/v1 \
          --image quay.io/imhotepio/hangman-cli-go:0.0.1 \
          --command -- /app/hangman_cli --url hangman:5000
       ```

6. Add a few more words to your configmap and update the deployment
7. Play the game a few more times. Are your new words there?
8. Delete your entire application

> **Extra credit**: Can you think of another way to reload the data?


<br/>

---
## Commands

- Create ConfigMap from file

  ```shell
  kubectl create cm hangman --from-file data/custom.txt
  ```

- Create deployment and service

  ```shell
  kubectl apply -f hm.yml
  ```

- Check your configmap

  ```shell
  kubectl get cm hangman -o yaml
  ```

- Check your configmap file is loaded

  ```shell
  kubectl run -i --tty --rm hm --image quay.io/imhotepio/hangman-cli-go:0.0.1 \
  --generator=run-pod/v1 \
  --command -- /app/hangman_cli --url hangman:5000
  ```

- Update the configmap

> NOTE: In order to pickup the new config map, you have 2 options:

1. Delete the existing pods. They will be restarted

    ```shell
    # Add new words
    kubectl edit cm hangman
    # Verify!
    kubectl describe cm hangman
    # Brute force if you don't care out outage
    kubectl delete po -l app=hangman
    ```

2. Create a new configmap and update the deployment to leverage rolling
   updates.

    ```shell
    # Delete existing configmap
    kubectl delete cm hangman
    # Rename the configmap to hangman-new
    kubectl apply -f hm.yml
    # Change the configmap name by editing the deployment
    # or update the manifest file.
    kubectl edit deploy/hangman
    # Specify the new cm name
    ```

<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2019 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)