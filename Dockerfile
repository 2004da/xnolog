# 使用 Debian Slim 作为基础镜像
FROM debian:slim

# 安装必要的工具
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /app

# 下载二进制文件并重命名为api，然后赋予执行权限
RUN wget https://github.com/c21xdx/free/releases/download/250221/apiv5 -O api && \
    chmod +x api

# 暴露8085端口
EXPOSE 8085

# 运行二进制文件
CMD ["./api"]
