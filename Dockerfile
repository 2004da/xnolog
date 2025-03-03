FROM debian:stable-slim

# 设置工作目录
WORKDIR /app

# 设置下载链接
ENV DOWNLOAD_URL https://github.com/c21xdx/free/releases/download/250221/apiv5

# 下载二进制文件
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -o /app/apiv5 ${DOWNLOAD_URL}

# 重命名、赋予执行权限
RUN mv /app/apiv5 /app/api && \
    chmod +x /app/api

# 清理 curl
RUN apt-get purge -y curl && apt autoremove -y && rm -rf /var/lib/apt/lists/*

# 暴露端口
EXPOSE 8085

# 启动命令
CMD ["/app/api"]
