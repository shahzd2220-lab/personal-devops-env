#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/personal-devops-env"
SERVICE_FILE="/etc/systemd/system/personal-devops-env.service"

sudo mkdir -p "$APP_DIR"
sudo cp -R src package.json .env.example "$APP_DIR"/

if [ ! -f "$APP_DIR/.env" ]; then
  sudo cp "$APP_DIR/.env.example" "$APP_DIR/.env"
fi

sudo tee "$SERVICE_FILE" >/dev/null <<'SERVICE'
[Unit]
Description=Personal DevOps Environment
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/personal-devops-env
EnvironmentFile=/opt/personal-devops-env/.env
ExecStart=/usr/bin/node src/server.js
Restart=always
RestartSec=5
User=www-data
Group=www-data

[Install]
WantedBy=multi-user.target
SERVICE

sudo systemctl daemon-reload
sudo systemctl enable personal-devops-env
sudo systemctl restart personal-devops-env
sudo systemctl status personal-devops-env --no-pager
