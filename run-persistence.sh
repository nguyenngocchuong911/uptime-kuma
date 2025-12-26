#!/bin/bash
set -e

# Khôi phục dữ liệu từ S3 nếu server mới khởi động lại
litestream restore -if-db-not-exists -if-replica-exists /app/data/kuma.db

# Chạy Litestream để đồng bộ dữ liệu liên tục
litestream replicate /app/data/kuma.db &

# Chạy Uptime Kuma chính thức
node server/server.js
