curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun
systemctl enable docker
systemctl start docker

# 添加阿里云的docker镜像代理，可以快速下载镜像
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://nj7j21cs.mirror.aliyuncs.com"]
}
EOF

systemctl restart docker

yum install  -y python3-pip
pip3 install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install docker-compose -i https://pypi.tuna.tsinghua.edu.cn/simple
pip uninstall cryptography -y

docker --version
docker-compose --version

yum install -y vim git zsh
git clone --depth=1 https://git.coding-space.cn/github/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
sh -c "$(curl -fsSL https://git.coding-space.cn/guange/files/raw/branch/master/shell/zsh/install.sh)"

# 扩容
# lvremove /dev/mapper/centos_192-home
# lvextend -L 990G /dev/mapper/centos_192-root
# xfs_growfs /dev/mapper/centos_192-root


# 设置静态ip
# cat /etc/sysconfig/network-scripts/ifcfg-ens192
echo "IPADDR=192.168.1.208" >> /etc/sysconfig/network-scripts/ifcfg-ens192
echo "NETMASK=255.255.255.0" >> /etc/sysconfig/network-scripts/ifcfg-ens192
echo "GATEWAY=192.168.1.1" >> /etc/sysconfig/network-scripts/ifcfg-ens192
echo "DNS1=114.114.114.114" >> /etc/sysconfig/network-scripts/ifcfg-ens192
echo "DNS2=8.8.8.8" >> /etc/sysconfig/network-scripts/ifcfg-ens192


# 关闭防火墙
systemctl stop firewalld
systemctl disable firewalld
systemctl restart docker
