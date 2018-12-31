systemctl stop firewalld
systemctl disable firewalld
yum -y install iptables-services
systemctl enable iptables
systemctl start iptables
