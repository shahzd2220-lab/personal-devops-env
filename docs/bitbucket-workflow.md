# Bitbucket Workflow

This project can run in Bitbucket too. Use Bitbucket as another remote when you
want to practice a second real-world Git hosting and CI/CD platform.

## What Bitbucket Adds

- Git hosting
- Pull requests
- Bitbucket Pipelines CI
- Branch-based workflow similar to GitHub

Bitbucket Pipelines can be free for small personal usage, but usage limits can
change. Treat cloud minutes as limited and check your Bitbucket workspace billing
page before running heavy builds.

## Create The Bitbucket Repo

1. Go to Bitbucket.
2. Create a new empty repository named `personal-devops-env`.
3. Do not initialize it with a README.
4. Copy the HTTPS repo URL.

It will look similar to:

```text
https://bitbucket.org/YOUR_WORKSPACE/personal-devops-env.git
```

## Add Bitbucket As A Second Remote

Keep GitHub as `origin`, and add Bitbucket as `bitbucket`:

```bash
git remote add bitbucket https://bitbucket.org/YOUR_WORKSPACE/personal-devops-env.git
git push -u bitbucket main
```

For this current feature branch:

```bash
git push -u bitbucket linux-systemd-deployment
```

## Branch And Pull Request Flow

Use the same professional workflow:

```bash
git checkout main
git pull
git checkout -b feature-name
```

Make changes, then:

```bash
git add .
git commit -m "Describe the change"
git push -u bitbucket feature-name
```

Then open a Bitbucket pull request:

```text
feature-name -> main
```

## Bitbucket Pipelines

The included `bitbucket-pipelines.yml` runs:

- `npm test`
- starts the app
- runs the `/health` smoke test
- stops the app

It runs for:

- pushes to `main`
- pull requests

## Recommended Use

Use GitHub as your main remote for now because it is already set up and passing.
Add Bitbucket when you want to practice a second platform:

```text
GitHub = primary
Bitbucket = practice mirror or alternate CI
```
