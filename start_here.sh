#!/usr/bin/env bash

gcloud info
if [[ $? != 0 ]]; then echo "Please install gcloud https://cloud.google.com/sdk/install"; exit; fi

kubectl version --client
if [[ $? != 0 ]]; then echo "Please install kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl/"; exit; fi

helm version --client
if [[ $? != 0 ]]; then echo "Please install helm: https://helm.sh/docs/using_helm/#installing-helm"; exit; fi

if [ -z "$GCP_PROJECT" ]; then
    echo "Please run: export GCP_PROJECT=<YOUR PROJECT ID>"
    exit
fi

gcloud auth login 
gcloud config set project $GCP_PROJECT
gcloud config set compute/zone europe-west6c

echo "it's reccomanded to setup bash completition by running:"
echo "source <( kubectl completion bash )"
echo  "source <( helm completion bash )"
