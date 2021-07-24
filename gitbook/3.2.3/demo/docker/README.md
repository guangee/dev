# docker基础服务

> 以下镜像目的为快速在linux服务器上安装中间件，不为环境折腾。
> 下面提到的中间件docker容器均使用docker-compose管理
> 目前已有的中间件均列出来，后续会持续补充，有不全的，欢迎联系我共同维护。
>

# 使用步骤

1. [安装docker引擎](mooc/docker.html)
2. 安装docker-compose

> 以下四种方式任选一种

```bash
# ubuntu
sudo apt update && apt install docker-compose -y

# centos
sudo yum update && yum install docker-compose -y

# pip3安装 假设已经安装好pip3
pip3 install docker-compose

# docker官网操作
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

3. 在某个目录下创建docker-compose.yml文件，将[基础服务](docker/base.html)下需要的文件内容复制过来.
4. 使用docker-compose命令启动容器

```bash
docker-compose up -d
```