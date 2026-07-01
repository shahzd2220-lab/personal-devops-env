# Linux Terminal Workflow On Windows

Use this when you want to work from Git Bash or the VS Code terminal instead of
PowerShell.

## Best Option

For your current setup, use **Git Bash inside VS Code**.

WSL Ubuntu is even closer to a real Linux server, but Git Bash is simpler if you
already have it installed.

## Open This Project In VS Code

From Git Bash:

```bash
cd /c/Users/khawa/Documents/Codex/2026-07-01/ca-2/outputs/personal-devops-env
code .
```

If `code .` does not work, open VS Code manually, then use:

```text
File -> Open Folder
```

Choose:

```text
C:\Users\khawa\Documents\Codex\2026-07-01\ca-2\outputs\personal-devops-env
```

## Set VS Code Terminal To Git Bash

In VS Code:

1. Open Terminal.
2. Click the dropdown next to the plus button.
3. Choose `Select Default Profile`.
4. Pick `Git Bash`.
5. Open a new terminal.

Now your VS Code terminal should look like a Linux-style shell.

## Run The Project From Git Bash

```bash
cd /c/Users/khawa/Documents/Codex/2026-07-01/ca-2/outputs/personal-devops-env
cp .env.example .env
npm test
npm start
```

Open:

```text
http://localhost:8080/health
```

## Smoke Test From Git Bash

Open a second Git Bash terminal:

```bash
cd /c/Users/khawa/Documents/Codex/2026-07-01/ca-2/outputs/personal-devops-env
bash scripts/smoke-test.sh http://localhost:8080
```

Important: run that inside **Git Bash**. If you type `bash` inside PowerShell on
this machine, Windows tries to use WSL, and WSL is not installed yet.

If you are in PowerShell and need to run the smoke test, use:

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\smoke-test.ps1 -BaseUrl http://localhost:8080
```

## Use Helper Script

```bash
cd /c/Users/khawa/Documents/Codex/2026-07-01/ca-2/outputs/personal-devops-env
bash scripts/run-local.sh
```

## Git Workflow From Git Bash

```bash
git init
git add .
git commit -m "Create personal DevOps environment"
git branch -M main
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

## Recommended Daily Workflow

```bash
cd /c/Users/khawa/Documents/Codex/2026-07-01/ca-2/outputs/personal-devops-env
git status
npm test
npm start
```

When finished:

```bash
git add .
git commit -m "Update project"
git push
```

## When To Use WSL Instead

Use WSL Ubuntu later if you want:

- real Linux package management with `apt`
- closer match to AWS/Linux servers
- smoother `systemd`, Terraform, SSH, and server tooling

For now, Git Bash in VS Code is enough to learn and run this DevOps environment.
