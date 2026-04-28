# Python App Containerization: Flask Blog Platform

A professional-grade migration of a Python/Flask web application into a lightweight, secure container environment. This project demonstrates advanced Linux administration and container networking.

## 🚀 The Infrastructure Challenge

The goal was to move beyond the "it works on my machine" hurdle. I successfully containerized this application using **Podman** on **Ubuntu**, solving several critical environment-level challenges:

* **Dependency Management:** Resolved complex C-library build errors for PostgreSQL adapters (psycopg2) on **Alpine Linux**.
* **Networking:** Engineered the container to bind to 0.0.0.0, enabling seamless communication between the isolated container and the host machine.
* **Security:** Implemented Environment Variable injection for CSRF keys and SMTP credentials, ensuring no sensitive data is hardcoded in the source.

## 🛠️ Tech Stack

* **Engine:** Podman (Docker compatible)
* **OS:** Alpine Linux (Lightweight base image)
* **Backend:** Python 3.11 / Flask
* **Security:** CSRF Protection, Environment Secret Management

## 📦 How to Run

### 1. Prerequisites

Ensure you have Podman or Docker installed on your Linux/WSL2 system.

### 2. Configuration

Create a `.env` file in the root directory (refer to `.env.example`):

```bash
SECRET_KEY=your_generated_secret_key
email=your_email@gmail.com
password=your_app_specific_password
```
### 3. Build the Image
```bash
podman build -t mini-blog .
```
### 4. Deploy the Container
```bash
podman run -d -p 5000:5000 --env-file .env --name blog-app mini-blog
```
The app will be accessible at http://localhost:5000

## 🛡️ Security Features
* **Non-Hardcoded Secrets**: All credentials are loaded at runtime via environment variables.
* **Production Readiness**: Configured to handle external host binding while maintaining internal isolation.
* **Lightweight Footprint**: Utilized Alpine Linux to reduce the attack surface and image size.
## 🎓 Learning Outcomes
This project enabled me to master:
1.	Building custom images from a Containerfile.
2.	Troubleshooting network namespaces and port forwarding.
3.	Managing multi-layered builds to optimize image size.

