FROM golang:latest AS builder

WORKDIR /app

# 复制 Go 项目文件到容器中
COPY go.mod ./
COPY *.go ./

# 编译应用程序
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o jrebel-license-active-server

# 第二阶段：创建一个轻量级的镜像，只包含编译后的可执行文件
FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /app

# 复制第一阶段中生成的可执行文件到第二阶段
COPY --from=builder /app/jrebel-license-active-server .

# 暴露应用程序使用的端口
EXPOSE 9080

# 容器启动时命令
ENTRYPOINT ["/app/jrebel-license-active-server"]

# 指定启动端口
CMD ["-p=9080"]