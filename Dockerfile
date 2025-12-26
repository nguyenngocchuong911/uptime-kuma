FROM louislam/uptime-kuma:1

# Cài đặt Litestream
ADD https://github.com/benbjohnson/litestream/releases/download/v0.3.13/litestream-v0.3.13-linux-amd64.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz

# Chép cấu hình và file chạy
COPY etc/litestream.yml /etc/litestream.yml
COPY run-persistence.sh /app/run-persistence.sh
RUN chmod +x /app/run-persistence.sh

EXPOSE 3001
CMD ["/app/run-persistence.sh"]
