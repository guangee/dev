# docker

> docker在手，天下我有。docker可以看做一个轻量级的虚拟机，我们可以把我们开发的服务，打包成一个标准的docker镜像，然后交付给运维去部署。因为我们的所有的环境都已经一起被打包到docker里了，所以可以避免本地运行ok，到了线上无法使用的故障。我们可以把静态网页，php项目，java项目，python项目做成docker镜像用于交付。也有许多基础的服务，被做成了标准的docker镜像，比如，redis，mysql，rabbitmq等。像ubuntu，centos官方也提供了docker镜像，我们可以基于这些镜像安装我们系统的环境，当然也有很多已经做好的环境，我们可以直接拿来用，比如，java，php，python等环境。

### 安装

```bash
# 对于常见的linux系统，可以使用docker的官方脚本一键安装
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun
# 国内下载docker镜像通常很慢，安装完毕后最好使用一下镜像来加速，这里使用阿里云的镜像进行加速。
sudo vim /etc/docker/daemon.json
{
  "registry-mirrors": ["https://nj7j21cs.mirror.aliyuncs.com"]
}
sudo systemctl daemon-reload
sudo systemctl restart docker
```

### 使用docker安装一些服务

```bash
# 启动个redis服务
docker run -d -p 6379:6379 --name redis redis
# 启动个带密码的redis
docker run -d -p 6379:6379 --name redis redis --requirepass "mypassword"

# 使用docker快速安装mysql
docker run -d --restart=always --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql
# 使用docker快速安装mariadb
docker run -d --restart=always --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mariadb
```



# Docker基本概念

```bash
# 镜像
> 打包了应用和运行环境的文件集合,可以认为就是编译好的软件

# 容器
> 类和对象的关系，类似运行起来的程序。

# 仓库
> 存储镜像的，分为共有仓库和私有仓库，类似于github和gitlab
```

# Docker基础命令

### 命令笔记

| 命令                             | 备注                         |
| -------------------------------- | ---------------------------- |
| docker images                    | 查看本地镜像                 |
| docker ps                        | 查看运行中的容器             |
| docker ps -a                     | 查看所有容器                 |
| docker run image:tag             | 创建一个容器并运行           |
| docker run -d image:tag          | 后台运行一个容器             |
| docker run -d -p 88:99 image:tag | 后台运行一个容器并加端口映射 |
| docker stop containerId          | 停止运行一个容器             |
| docker start containerId         | 启动一个停止状态的容器       |
| docker pull image:tag            | 从远程下载一个镜像           |
| docker rm containerId            | 删除一个已经停止的容器       |
| docker rmi imageId               | 删除本地某个镜像             |
| docker logs -f -t containerId    | 查看日志运行日志             |
|                                  |                              |
|                                  |                              |



# 将项目打包成docker

### SpringBoot项目

```bash
FROM openjdk:8u222-jre
RUN echo "Asia/Shanghai" > /etc/timezone
ADD server.jar app.jar
ADD lib/arcsoft_lib /arcsoft_lib
CMD ["java","-Xms256m", "-Xmx512m","-Dspring.profiles.active=docker","-jar","/app.jar"]
```



### php项目

```bash
# 指定基础镜像
FROM php:5.6-apache
# 把php文件加进来
ADD src /var/www/html/
```

# [练习包](https://static-source-guan.oss-cn-beijing.aliyuncs.com/practice.zip)