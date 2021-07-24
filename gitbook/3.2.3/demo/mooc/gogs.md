# 学习目标

1. 学会在阿里云购买linux服务器搭建私有git托管网站gogs。
2. git默认端口3000，学会使用nginx反向代理，用默认80端口号来使用我们的git网站



```bash
apt update
apt install git
# 下载gogs安装包
wget https://owncloud.coding-space.cn/soft/gogs_0.11.53_linux_amd64.tar.gz
# 解压
tar -xzvf gogs_0.11.53_linux_amd64.tar.gz
# 前台启动 随着shell终端关闭而关闭
./gogs web
# 后台启动 在系统后台运行，可以随时关闭shell终端而不影响系统的运行
nohup ./gogs web &
# 创建ssh秘钥
ssh-keygen -C "roma@guanweiming.com"

# 安装nginx
apt install nginx
# 配置反向代理
location / {
        proxy_pass http://127.0.0.1:3000;
}
# 查看进程的pid
 ps -ef | grep gogs
# 根据pid杀死进程
kill ${pid}

# roma@guanweiming.com
```



# FAQ

###### 什么是gogs？

gogs是一个开源的git托管网站的软件，我们可以把这套系统安装在我们自己的服务器上。

###### 为什么要自己搭建？

因为公司里代码为了安全，不放心市场上的那些第三方托管平台。

###### 这个跟gitlab比有什么优势？

这个比较轻量级，中文界面比较友好，运行起来只需要占用极少的系统资源。

