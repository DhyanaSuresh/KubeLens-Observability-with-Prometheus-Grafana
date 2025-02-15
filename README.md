# KubeLens-Observability-with-Prometheus-Grafana

Welcome to **Kubernetes Monitoring & Observability**! This project sets up a full observability stack using **Prometheus, Grafana, and Kubernetes**, helping you monitor cluster health, metrics, and logs efficiently. 📊🔥

![Observability Banner](https://user-images.githubusercontent.com/YOUR_GITHUB_USERNAME/your-image.png)  

---

## 📌 Features
✅ Kubernetes Monitoring using **Prometheus**  
✅ Data Visualization with **Grafana Dashboards**  
✅ Node & Pod-level Metrics Collection  
✅ Real-time Observability with **Alerts & Dashboards**  

---

## 🚀 Setup & Installation

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

### 2️⃣ Start Minikube
Ensure Minikube is running:
```sh
minikube start
```

### 3️⃣ Deploy Prometheus & Grafana
```sh
kubectl apply -f manifests/
```

### 4️⃣ Verify Services
Check if all components are running:
```sh
kubectl get pods
kubectl get svc
```

### 5️⃣ Access Grafana Dashboard
Find the **NodePort** for Grafana and access it via Minikube IP:
```sh
echo "Grafana URL: http://$(minikube ip):<grafana-nodeport>"
```
Login Credentials:
- **Username:** admin
- **Password:** prom-operator

---

## 📡 Access Prometheus
Find the **NodePort** and open Prometheus UI:
```sh
echo "Prometheus URL: http://$(minikube ip):<prometheus-nodeport>"
```

---

## 📊 Grafana Dashboards
Import the following dashboards in Grafana:
- **Kubernetes Cluster Metrics** (ID: `3119`)
- **Node Exporter Dashboard** (ID: `1860`)

---

## 💡 Contributing
Feel free to **fork** this repo, add improvements, and submit a **PR**! Let's build something amazing together. 💙
 
📧 **Email**: dhyanasuresh19@gmail.com
