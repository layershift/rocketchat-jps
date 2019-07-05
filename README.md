# High availability and auto-scaled Rocket.Chat

## Highlights

Rocket.Chat is a Web Chat Server, developed in JavaScript, using the Meteor fullstack framework.

## Environment Topology

The JPS package will deploy [Rocket.Chat](https://github.com/RocketChat/Rocket.Chat) instance that will initially contian 

* 1 nginx balancer to handle SSL and traffic
* 2 node.js containers with application itself
* 1 MongoDB ReplicaSet instance (3 MongoDB servers)

### Specifics

 Layer | Server          | Number of CTs <br/> by default | Cloudlets per CT <br/> (reserved/dynamic) | Options
-------|-----------------| :-----------------------------:|:-----------------------------------------:|:-----:
LB     | Nginx 1.12.2    |           1                    |           1/6                             |   -
AS     | Node.js 8.12.0  |           2                    |           1/16                            |   -
DB     | MongoDB 4.0.9   |           3                    |           1/16                            |   -

* LB - Load balancer
* AS - Application server
* DB - Database

**Rocket.Chat version**: 1.0.3     

## Automatic scaling

Application layer is set to scale up to 4 indivirual Rocket.Chat instances if CPU load is higher than 70% over last 1 minute.

It will automatically scale down if load gets to lower than 10% of CPU usage over last 15 minutes to the original 2 application node setup.

See more on autoscaling: https://docs.jelastic.com/automatic-vertical-scaling

---

## Differences from https://github.com/jelastic-jps/rocket-chat

- deployed to NodeJS templates (horizontally scaled) vs. deployed to rocketchat docker image (single compute node)     
- database backend is MongoDB ReplicaSet (3 MongoDB servers) vs. single MongoDB node      

## Deployment

[![Deploy to Layershift Jelastic PaaS](images/layershift-install-3.png)](http://jps.layershift.com/rocketchat/deploy.html)

# LICENSE

Licensed under GNU LGPLv3
