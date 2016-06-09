Development using Docker
========================
This repository contains all my `docker`, docker-machine, docker-compose related settings and configuration files

Creating Machine
----------------
> If you are not using docker-machine you can skip this section

To create machine run the command below
```
$docker-machine create --driver virtualbox --virtualbox-cpu-count 2 --virtualbox-memory "4096" --virtualbox-disk-size "10000" devbox
$eval $(docker env devbox)
$docker-machine ip devbox
```
You may need to mount the host directory into the docker as follows
```
#from host
$docker-machine ssh devbox
#In Docker Machine (workzone path in host is /media/devzone/workzone)
$sudo mkdir /nmrony && sudo mount -t vboxsf workzone /nmrony
```
Creating VPN Networks
---------------------
All configurations are depends on two custom vpn network `ronsvpn_backend` and `ronsvpn_proxy`. Create these VPNs as
follows

```sh
$docker network create ronsvpn_proxy
$docker network create ronsvpn_backend
```

Creating Containers
-------------------
- To start LEMP Stack run the following commnad
```
docker-compose up -d
```
