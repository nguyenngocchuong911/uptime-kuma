#!/bin/bash
set -e

# 1. Khôi phục dữ liệu từ S3 (Backblaze) nếu đã có bản sao lưu
echo "==> Restoring database..."
litestream restore -if-db-not-exists -if-replica-exists /app/data/kuma.db

# 2. Chạy Litestream ngầm để đồng bộ dữ liệu liên tục
echo "==> Starting replication..."
litestream replicate /app/data/kuma.db &

# 3. Chạy Uptime Kuma
echo "==> Starting Uptime Kuma..."
node server/server.js
