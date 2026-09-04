#!/usr/bin/env bash
set -euo pipefail

apt-get update
apt-get install -y curl ca-certificates
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

APP_DIR="/opt/app"

if [ -f "${APP_DIR}/package-lock.json" ]; then
  sudo -u vagrant npm --prefix "${APP_DIR}" ci --omit=dev
fi

cat > /etc/systemd/system/node-app.service <<'EOF'
[Unit]
Description=Aplicacao Node.js de producao
After=network.target

[Service]
Type=simple
User=vagrant
WorkingDirectory=/opt/app
Environment=NODE_ENV=production
ExecStart=/usr/bin/node /opt/app/server.js
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable node-app.service
systemctl restart node-app.service
