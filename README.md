# kcp-client 可部署至daocloud.io,与arukas.io上部署的 kcp-ss配合使用。
###Default configuration in environment variables

KCP_PORT    4440/tcp

KCP_MODE    fast

MTU         1400

SNDWND      128

RCVWND      512

DATASHARD   10

PARITYSHARD 3

#设置环境变量 REMOTEADDR 为 seaof-xxx-xxx-xxx-xxx.jp-tokyo-21.arukascloud.io:xxxxx 
# daocloud.io docker 免费容器
1、运行时间为24小时，须手动启动。

2、入站与出站速度限制为5Mbps。

3、默认TCP监听端口4440。
