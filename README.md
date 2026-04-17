# 🚀 CI/CD Pipeline with Jenkins, Docker & Kubernetes

This project demonstrates a complete **CI/CD pipeline** using:

* GitHub (Source Code)
* Jenkins (CI/CD Automation)
* Docker (Containerization)
* Docker Hub (Image Registry)
* Kubernetes / Minikube (Deployment)

---

# 📌 Project Overview

This pipeline automatically:

1. Detects code changes pushed to GitHub
2. Triggers Jenkins via webhook
3. Builds a Docker image
4. Pushes the image to Docker Hub
5. Deploys the updated image to Kubernetes

---

# 🏗️ Architecture

```
GitHub (push)
     ↓
Webhook
     ↓
Jenkins
     ↓
Docker Build
     ↓
Docker Hub
     ↓
Kubernetes (Minikube)
     ↓
Application Running
```

---

# ⚙️ Technologies Used

* Jenkins
* Docker
* Docker Hub
* Kubernetes (Minikube)
* Git & GitHub
* Ngrok (for webhook exposure)

---

# 📂 Project Structure

```
cicd-project/
│── Dockerfile
│── app.txt
│── README.md
```

---

# 🔄 CI/CD Pipeline Flow

### 🔹 Step 1: Code Push

* Developer pushes code to `main` branch

### 🔹 Step 2: Jenkins Trigger

* GitHub webhook triggers Jenkins job

### 🔹 Step 3: Build Stage

* Jenkins builds Docker image

```bash
docker build -t <docker-username>/cicd-app .
```

---

### 🔹 Step 4: Push Stage

* Image pushed to Docker Hub

```bash
docker push <docker-username>/cicd-app:latest
```

---

### 🔹 Step 5: Deploy Stage

* Kubernetes deployment restarted

```bash
kubectl rollout restart deployment cicd-app
```

---

# 🐳 Docker Setup

### Example Dockerfile:

```dockerfile
FROM alpine:latest

RUN apk add --no-cache python3

WORKDIR /app

COPY app.txt .

CMD ["python3", "-m", "http.server", "80"]
```

---

# ☸️ Kubernetes Setup

### Create Deployment

```bash
kubectl create deployment cicd-app \
--image=<docker-username>/cicd-app:latest
```

---

### Expose Service

```bash
kubectl expose deployment cicd-app \
--type=NodePort \
--port=80
```

---

### Access Application

```bash
minikube service cicd-app
```

---

# 🔐 Jenkins Setup

### Plugins Required

* Git Plugin
* Docker Pipeline
* Pipeline Plugin

---

### Jenkins Job Configuration

* Source Code Management: Git
* Repository URL: your GitHub repo
* Branch: `main`

---

### Build Steps (Shell)

```bash
echo "Building Docker image..."
docker build -t <docker-username>/cicd-app .

echo "Pushing image..."
docker push <docker-username>/cicd-app:latest

echo "Deploying to Kubernetes..."
kubectl rollout restart deployment cicd-app
```

---

# 🌐 Webhook Setup (GitHub → Jenkins)

1. Go to GitHub repo → Settings → Webhooks
2. Add webhook URL:

```
http://<ngrok-url>/github-webhook/
```

3. Content type: `application/json`
4. Trigger: Just push event

---

# 🌍 Ngrok Setup

Expose Jenkins:

```bash
ngrok http 8080
```

Use generated HTTPS URL in GitHub webhook.

---

# ✅ How to Run

### 1. Start Minikube

```bash
minikube start
```

---

### 2. Run Jenkins Container

```bash
docker run -d \
--name jenkins \
--network host \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v ~/.kube:/root/.kube \
-v ~/.minikube:/root/.minikube \
jenkins-docker
```

---

### 3. Push Code

```bash
git add .
git commit -m "trigger pipeline"
git push
```

---

# 🧪 Testing the Pipeline

* Push any change to `main`
* Jenkins job should trigger automatically
* Check:

  * Docker image updated
  * Kubernetes pods restarted

---

# 🎯 CI vs CD in This Project

### ✅ Continuous Integration (CI)

* Code pushed → Jenkins builds Docker image

### ✅ Continuous Delivery (CD)

* Image pushed → Kubernetes auto-updated

---

# 🚀 Result

After pushing code:

* Jenkins runs automatically
* Docker image is rebuilt
* Kubernetes updates application
* Changes reflect in browser

---

# 🔥 Future Improvements

* Use versioned Docker tags (v1, v2, v3)
* Add automated testing stage
* Implement rolling updates / zero downtime
* Use Jenkins Pipeline (Jenkinsfile)
* Deploy to cloud (AWS / GCP)

---

# 👨‍💻 Author

Chalaka Perera

---

# ⭐ Conclusion

This project demonstrates a **complete DevOps pipeline** from code commit to live deployment using modern tools.

---
