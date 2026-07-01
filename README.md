# Personal DevOps Environment

This is a complete starter project you can use for personal work. It includes a
small Node.js web service plus the DevOps files needed to test, run, automate,
and deploy it without requiring Docker.

## What You Have

- A working HTTP app in `src/server.js`
- Health and info endpoints
- Node's built-in test runner
- No-Docker local scripts
- GitHub Actions CI
- Jenkins pipeline
- AWS EC2/Linux `systemd` Terraform starter
- AWS ECS/Fargate Terraform starter for optional container work later
- Kubernetes manifests
- Linux setup and deployment scripts
- Prometheus/Grafana monitoring starter
- Smoke test script
- Environment example
- Makefile shortcuts
- Architecture diagram and real-environment checklist in `docs/architecture-and-next-steps.md`

Docker files are still included as optional references, but they are not required
for the main personal workflow.

## Run Locally

```powershell
Copy-Item .env.example .env
npm test
npm start
```

Then open:

```text
http://localhost:8080
http://localhost:8080/health
http://localhost:8080/info
```

Or use the helper script:

```powershell
.\scripts\run-local.ps1
```

## Smoke Test

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\smoke-test.ps1 -BaseUrl http://localhost:8080
```

## Put It On GitHub

```powershell
git init
git add .
git commit -m "Create personal DevOps environment"
git branch -M main
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

GitHub Actions will run automatically on pushes and pull requests.

## Jenkins

Use `Jenkinsfile` for a no-Docker Jenkins pipeline. It runs:

- `npm test`
- starts the app
- runs the smoke test
- stops the app

If you already have Jenkins installed, create a Pipeline job and point it at this
repo.

If you later decide you want Jenkins in Docker, the optional file is still here:

```powershell
docker compose -f jenkins/compose.jenkins.yaml up -d
```

Open:

```text
http://localhost:8081
```

Then create a Pipeline job that uses the `Jenkinsfile` in this repo.

## Deploy To Kubernetes

Kubernetes usually expects a container image. Since you want to avoid Docker for
now, treat this as optional future material unless you use a remote builder such
as GitHub Actions, AWS CodeBuild, Google Cloud Build, or another image builder.

Update these values first:

- `k8s/deployment.yaml`: replace `CHANGE_ME_IMAGE`
- `k8s/ingress.yaml`: replace `CHANGE_ME_DOMAIN`
- `k8s/secret.example.yaml`: replace secret values, then save as your real secret file

Apply:

```powershell
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/secret.example.yaml
kubectl apply -f k8s/
```

## Deploy To AWS Without Docker

Use the EC2 + Linux `systemd` Terraform setup:

```powershell
cd infra/terraform/aws-ec2-systemd
Copy-Item terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars`, then run:

```powershell
terraform init
terraform plan
terraform apply
```

That creates a small Ubuntu EC2 instance, installs Node.js, and runs this app as
a Linux service.

## Optional: Deploy To AWS ECS

AWS ECS also expects a container image. For a no-Docker personal setup, use the
Linux `systemd` deployment first. Keep the ECS Terraform for later when you want
a container deployment.

Install and configure:

- AWS CLI
- Terraform

Then edit:

```text
infra/terraform/aws-ecs/terraform.tfvars.example
```

Copy it to `terraform.tfvars`, fill in your VPC/subnet/image values, and run:

```powershell
cd infra/terraform/aws-ecs
terraform init
terraform plan
terraform apply
```

## Linux Machine Setup

On Ubuntu/Debian, run:

```bash
chmod +x linux/*.sh scripts/*.sh
./linux/install-tools.sh
./linux/run-local.sh
```

Use `linux/deploy-systemd.sh` when you want to run this app as a simple Linux
service outside Docker.

## No-Docker Recommended Path

1. Install Node.js 20 or newer.
2. Run `npm test`.
3. Run `npm start`.
4. Run `.\scripts\smoke-test.ps1 -BaseUrl http://localhost:8080`.
5. Push to GitHub and let CI run.
6. Deploy to a Linux server with `linux/deploy-systemd.sh`.

## Personal Workflow

1. Write code in `src`.
2. Add tests in `test`.
3. Run `npm test`.
4. Run the smoke test.
5. Deploy with Linux `systemd` when ready.
6. Commit and push.

That gives you a real DevOps rhythm without needing Docker or a complicated
cloud setup on day one.

## Diagram And Next Steps

Open:

```text
docs/architecture-and-next-steps.md
```

That file has the environment diagram, recommended real-world order of work, and
a checklist for taking this from local machine to GitHub, Jenkins, Linux, and AWS.

## Linux-Style Terminal On Windows

If you want to use Git Bash or the VS Code terminal instead of PowerShell, open:

```text
docs/linux-terminal-workflow.md
```
