# High availability and auto-scaled Rocket.Chat

## Highlights

Rocket.Chat is a Web Chat Server, developed in JavaScript, using the Meteor fullstack framework.

## Environment Topology

The JPS package will deploy [Rocket.Chat](https://github.com/RocketChat/Rocket.Chat) instance that will initially contian 

* 1 nginx balancer to handle SSL and traffic
* 1 node.js container with application itself
* 1 MongoDB instance

### Specifics

 Layer | Server          | Number of CTs <br/> by default | Cloudlets per CT <br/> (reserved/dynamic) | Options
-------|-----------------| :-----------------------------:|:-----------------------------------------:|:-----:
LB     |      Nginx      |           1                    |           1/8                             |   -
AS     |   Node.js 4.5   |           1                    |           1/16                            |   -
DB     |   MongoDB 3.4   |           1                    |           1/16                            |   -

* LB - Load balancer
* AS - Application server
* DB - Database

**Rocket.Chat version**: 0.52.0

---

## Deployment

[Deploy to Layershift Jelastic PaaS](http://jps.layershift.com/rocketchat/deploy.html)

