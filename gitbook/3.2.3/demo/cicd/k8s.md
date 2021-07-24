# k8s

##### 使用rancher安装k8s

> rancher官方文档 https://rancher.com/quick-start/
> 需要先安装好docker引擎，在国内的可以配置一下docker代理，便于快速拉镜像

```bash
# 先拉一下镜像，这样启动快一些。镜像都有一个唯一的imageId，先下载国内镜像，这个比较快，相同imageId的镜像就可以不用重复下载。
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/rancher:v2.4.15
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/rancher-agent:v2.4.15
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/rancher/rke-tools:v0.1.72
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/hyperkube:v1.18.16-rancher1
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/nginx-ingress-controllernginx-0.35.0-rancher2
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/calico-node:v3.13.4
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/calico-pod2daemon-flexvol:v3.13.4
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/calico-cni:v3.13.4
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/coredns-coredns:1.6.9
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/coreos-flannel:v0.12.0
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/kube-api-auth:v0.1.4
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/coreos-etcd:v3.4.3-rancher1
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/metrics-server:v0.3.6
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/cluster-proportional-autoscaler:1.7.1
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/nginx-ingress-controller-defaultbackend:1.5-rancher1
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/pause:3.1

# 启动rancher
docker run --privileged -d \
  --restart=unless-stopped \
  -p 8080:80 -p 8443:443  rancher/rancher:v2.4.15

```
