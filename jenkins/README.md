# Jenkins Setup

Start Jenkins locally:

```powershell
docker compose -f jenkins/compose.jenkins.yaml up -d
```

Open `http://localhost:8081`.

Create a Pipeline job and point it at this repository's `Jenkinsfile`.

Useful Jenkins environment variables:

- `DOCKER_REGISTRY`: optional registry host, such as Docker Hub, ECR, or GHCR
- `AWS_REGION`: needed if your later pipeline pushes to AWS ECR
- `KUBE_CONFIG`: use Jenkins credentials for Kubernetes access

For personal work, use Jenkins as a learning lab first. GitHub Actions is simpler
for day-to-day automation, while Jenkins is useful when you want hands-on CI/CD
practice.
