#!/usr/bin/env bash
set -euo pipefail

# Reutiliza o provisionamento de Node.js para manter as duas VMs na mesma versão.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bash "${SCRIPT_DIR}/setup-node.sh"

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
