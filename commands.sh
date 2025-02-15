#!/bin/bash

# 🚀 Kubernetes Observability Setup Script
# This script sets up Prometheus and Grafana on a Kubernetes cluster using Helm

# Step 1: Start Minikube
# Ensure Minikube is installed and start the cluster
minikube start

# Step 2: Verify Kubernetes is running
kubectl cluster-info

# Step 3: Add Helm Repositories
# Helm must be installed (downloaded from Docker)
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Step 4: Install Prometheus using Helm
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace

# Step 5: Verify Prometheus Installation
kubectl get pods -n monitoring
kubectl get svc -n monitoring

# Step 6: Install Grafana using Helm
helm install grafana grafana/grafana --namespace monitoring

# Step 7: Expose Grafana Service (NodePort)
kubectl expose deployment grafana --type=NodePort --name=grafana-ext --namespace monitoring

# Step 8: Retrieve Grafana Access Details
GRAFANA_PORT=$(kubectl get svc grafana-ext -n monitoring -o jsonpath='{.spec.ports[0].nodePort}')
echo "Grafana Dashboard available at: http://$(minikube ip):$GRAFANA_PORT"

# Step 9: Retrieve Prometheus Access Details
PROMETHEUS_PORT=$(kubectl get svc prometheus-kube-prometheus-prometheus -n monitoring -o jsonpath='{.spec.ports[0].nodePort}')
echo "Prometheus available at: http://$(minikube ip):$PROMETHEUS_PORT"

# Step 10: Port Forwarding for Grafana (Optional)
kubectl port-forward --namespace monitoring svc/grafana-ext 3000:80 &

# Step 11: Port Forwarding for Prometheus (Optional)
kubectl port-forward --namespace monitoring svc/prometheus-kube-prometheus-prometheus 9090:9090 &

# 🎉 Setup Complete!
echo "Monitoring Stack Deployed Successfully!"
