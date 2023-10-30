基于 https://github.com/yu-xiaoyao/jrebel-license-active-server 生成

增加了Dockerfile方便构建为镜像

## Win编译
```shell
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build ./
```
- GOOS
    - linux
    - windows
    - darwin : MacOS
- GOARCH:
    - amd64 : 64位
    - 386:  : 32位
## Mac编译
```shell
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build ./
```

## Docker
```shell
# create image
docker build myjrebelserver .

# run
docker run  -it -p 9080:9080 --name myjrebelserver jrebelserver:latest
```

## 运行
默认端口: 12345
```shell
# 自定义端口
./license-active-server --port=5555
```