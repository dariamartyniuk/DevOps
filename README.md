# Kubernetes-Docker Prometheus and Grafana Application

This repository contains a Kubernetes-based monitoring solution using Prometheus and Grafana, deployed using Docker. It sets up Prometheus for monitoring metrics and Grafana for visualizing those metrics. The deployment runs on a Kubernetes cluster, using Minikube for local development.

## Prerequisites

Before you start, ensure you have the following installed:

- [Docker](https://www.docker.com/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm (optional)](https://helm.sh/docs/intro/install/)

## Setup Instructions

### 1. Start Minikube

Make sure Minikube is running and the Kubernetes cluster is set up:

```bash
minikube start
```

Check the Minikube status:

```bash
minikube status
```

### 2. Apply Kubernetes Manifests

To deploy Prometheus, Grafana, and other necessary resources, apply the manifests provided in the repository:

```bash
kubectl apply -f .
```

> **Note:** The `secret.yaml` contains credentials that need to be base64-encoded. You can base64-encode credentials as follows:
> 
> ```bash
> echo -n "your-username" | base64
> echo -n "your-password" | base64
> ```

### 3. Expose Prometheus and Grafana

Prometheus and Grafana services are exposed using port forwarding.

- To access **Prometheus**, forward port 9090:

  ```bash
  kubectl port-forward svc/prometheus-service 9090:9090
  ```

  Access Prometheus at: `http://localhost:9090`

- To access **Grafana**, forward port 3000:

  ```bash
  kubectl port-forward svc/grafana-service 3000:3000
  ```

  Access Grafana at: `http://localhost:3000`

### 4. Configure Grafana

1. Log in to Grafana using the credentials defined in `secret.yaml` (the default is `admin/admin`).
2. Once logged in, you can add Prometheus as a data source:
   - Go to **Configuration** > **Data Sources**.
   - Click **Add Data Source** and select **Prometheus**.
   - Enter the URL `http://prometheus-service:9090` for Prometheus.
   - Click **Save & Test**.

### 5. Verify Deployment

- Check the status of the pods:

  ```bash
  kubectl get pods
  ```

- Check the logs for troubleshooting:

  ```bash
  kubectl logs <pod-name>
  ```


This project is licensed under the MIT License.

---

This README provides a comprehensive guide to setting up and running your Kubernetes application with Prometheus and Grafana. Feel free to customize it further based on your specific deployment or any additional steps unique to your environment.
