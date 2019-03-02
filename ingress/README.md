<img src="../assets/k8sland.png" align="right" width="128" height="auto"/>

<br/>

# <img src="../assets/lab.png" width="32" height="auto"/> Ingress Controller Lab

> The dev team has been hard at work and came up with a new set of dictionaries
> for the company flagship product *Hangman*. The Hangman game is composed of
> 2 HTTP services: hangman and dictionary. The dictionary service serves a
> collection of words. The hangman service calls the dictionary to get a list
> of words, picks a random word and seeds the guessing game with that word.

In this lab we're going to setup an ingress controller to allow us to play
*Hangman* from two separate microservices stacks and leverage a *Traefik* ingress
to mutiplex across the two stacks.

1. Provision your cluster with a **Traefik** ingress via a DaemonSet
1. Deploy hangman v1 and v2 using the provided manifests
1. Verify you can access the Traefik UI
1. Create an ingress resource that allows to switch between the 2 instances of
   the hangman service. Leverage named hosting, setup the ingress to direct
   traffic to either the **trump** version (v1) or the **halloween** version (v2)
1. Verify the Traefik UI shows the live backends and frontends
1. Play the v1 game using Hangman CLI
1. Next play the v2 game
1. Make sure both instances are serving words from the correct dictionaries
1. Delete your application!

---
## Commands

- Deploy Traefik Ingress + RBAC

    ```shell
    kubectl apply -f k8s/traefik
    ```

- Poor man DNS setup!

    ```shell
    echo "$(minikube ip) traefik-ui.minikube trump.minikube halloween.minikube" | sudo tee -a /etc/hosts
    ```

- Launch Traefik UI

    ```shell
    open http://traefik-ui.minikube/dashboard/
    ```

- Deploy Hangman v1, v2

    ```shell
    kubectl apply -f k8/hangman1 -f k8s/hangman2
    ```

- Play!

   ```shell
   # On OSX...
   bin/hangman -hm trump.minikube
   bin/hangman -hm halloween.minikube
   # Or hit the ingress using http
   http trump.minikube/new_game
   http halloween.minikube/new_game
   ```


<br/>

---
<img src="../assets/imhotep_logo.png" width="32" height="auto"/> © 2018 Imhotep Software LLC.
All materials licensed under [Apache v2.0](http://www.apache.org/licenses/LICENSE-2.0)