# SpringCloud

* 网关 gateway
* 注册中心 [nacos](https://github.com/alibaba/nacos)

```bash
# 下载nacos
wget https://github.com/alibaba/nacos/releases/download/1.4.0/nacos-server-1.4.0.zip
# 解压缩并启动nacos
unzip nacos-server-1.0.0.zip
cd nacos/bin 
bash startup.sh -m standalone
# 访问 http://ip:8848/nacos
# 账号 nacos 密码 nacos
```

* 配置中心 [nacos](https://github.com/alibaba/nacos)
* 用户服务
* 订单服务
* 消息服务
