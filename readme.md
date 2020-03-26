
* Build
```bash
docker build -t helm-kubectl .
```

* Run helm-kubectl image locally
```bash
docker run -it --rm `
  --entrypoint=/bin/sh `
  -v <path to root project>:/apps `
  -v <host machine user>/.kube:/root/.kube `
  -v <host machine user>/.helm:/root/.helm `
  helm-kubectl
```

* Create docker secret
```bash
kubectl create secret docker-registry regcred --docker-username=<your-name> --docker-password=<your-pass>
```

* Do Stuff
```bash
if kubectl get namespace | grep webnerdbot-dev ; then kubectl delete namespace webnerdbot-dev ; sleep 60 ; fi ;
kubectl create namespace webnerdbot-dev
helm upgrade --install --force --namespace webnerdbot-dev --values ./webnerdbot-services.yml "webnerdbot-services" ./helmt-webnerdbot-dev
# helm delete --namespace webnerdbot-dev webnerdbot-services
```  