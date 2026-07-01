.PHONY: test run smoke install docker-build docker-up docker-down k8s-apply k8s-delete jenkins-up jenkins-down

install:
	npm install

test:
	npm test

run:
	npm start

docker-build:
	docker build -t personal-devops-env:local .

docker-up:
	docker compose up --build

docker-down:
	docker compose down

smoke:
	pwsh ./scripts/smoke-test.ps1 -BaseUrl http://localhost:8080

k8s-apply:
	kubectl apply -f k8s/

k8s-delete:
	kubectl delete -f k8s/

jenkins-up:
	docker compose -f jenkins/compose.jenkins.yaml up -d

jenkins-down:
	docker compose -f jenkins/compose.jenkins.yaml down
