FROM louislam/uptime-kuma:1

# Tạo thư mục data và cấp quyền trước khi chạy
USER root
RUN mkdir -p /app/data && chown node:node /app/data

# Cài đặt Litestream để sao lưu
ADD https://github.com/benbjohnson/litestream/releases/download/v0.3.13/litestream-v0.3.13-linux-amd64.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz

# Chép các file cấu hình
COPY etc/litestream.yml /etc/litestream.yml
COPY run-persistence.sh /app/run-persistence.sh
RUN chmod +x /app/run-persistence.sh

EXPOSE 3001

# Chạy bằng file script của chúng ta
CMD ["/app/run-persistence.sh"]
