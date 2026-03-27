# Istio Service mesh 
This service provides your workloads with additional 

- Observability 🔭
- mTLS 🔐
- Traffic Control 🎛️
- Policy Enforcement and Security  
  
# Installing Istio Service Mesh with helm ☸️

helm repo add istio https://istio-release.storage.googleapis.com/charts

helm repo update 

# Creating namespace and installing istio base chart and pod 📈

kubectl create namespace istio-system

# Install CRDS 
helm install istio-base istio/base -n istio-system 

# Install control plane
helm install istiod istio/istiod -n istio-system


# Label namespace (default, prod, dev, test)

kubectl label namespace default istio-injection=enabled --overwrite

# Uninstall istio service-mesh and remove ns label 

kubectl label namespace default istio-injection=enabled-

kubectl get ns -L istio-injection 

helm uninstall istio-base istio/base -n istio-system 

helm uninstall istiod istio/istiod -n istio-system



