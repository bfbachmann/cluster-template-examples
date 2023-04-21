VALUES ?= ./charts/values-do-bruno.yaml
RELEASE ?= bruno-rke2

.PHONY: printconfig
printconfig:
	@echo "KUBECONFIG=$(KUBECONFIG)"

.PHONY: install
install: printconfig
	helm --kube-insecure-skip-tls-verify install --namespace fleet-default --values $(VALUES) $(RELEASE) ./charts

.PHONY: upgrade
install: printconfig
	helm --kube-insecure-skip-tls-verify upgrade --install --namespace fleet-default --values $(VALUES) $(RELEASE) ./charts