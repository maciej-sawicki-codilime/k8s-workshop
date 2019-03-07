#curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash
#helm init --client-only
#helm plugin install https://github.com/rimusz/helm-tiller
#helm plugin install https://github.com/databus23/helm-diff --version master
export HELM_TILLER_PORT=44134
export HELM_HOST=127.0.0.1:${HELM_TILLER_PORT}
helm tiller start-ci
if (: < /dev/tcp/127.0.0.1/$HELM_TILLER_PORT) 2>/dev/null
then
#	helm install stable/traefik --name traefik-ingress --namespace kube-system
#    helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
#    helm install --debug --name kavachsec-kafka incubator/kafka --namespace kavachsec-kafka
    echo "Tiller is ready"

else
    echo "[ERROR] helmes tiller not listening!"
fi
