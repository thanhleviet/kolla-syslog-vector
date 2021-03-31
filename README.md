## Log aggregation of openstack kolla for syslog using vector.dev


## What it does

A toml configuration file is defined to aggregate openstack kolla logs and dump into a syslog formatted file `/var/log/vector-kolla.log`:
- neutron
- nova
- cinder
- glance
- rabbitmq
- openvswitch
- heat

## How to run

```
docker run -d --name qib-vector --restart unless-stopped \
--hostname=$(hostname) \
-v $(pwd)/vector-kolla.toml:/etc/vector/vector.toml:ro \
-v /home/ubuntu/kolla-logs:/log/kolla \
-v /var/log:/var/log \
-p 8383:8686 \
timberio/vector:0.12.X-debian
```

## Notes:

Need to configure logrotate for `/var/log/vector-kolla.log`

## Todo

- To improve parsing multiline