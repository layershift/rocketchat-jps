#!/bin/bash
MASTER_IP=$1
SLAVE1_IP=$2
SLAVE2_IP=$3
MONGO_PWD=$4

mongo << EOF
    rs.initiate();
EOF

sleep 1;

mongo << EOF
    rs.add("${SLAVE1_IP}");
    rs.add("${SLAVE2_IP}");
EOF

sleep 1;

mongo << EOF
    cfg=rs.conf()
    cfg.members[0].host = "${MASTER_IP}"
    cfg.members[1].host = "${SLAVE1_IP}"
    cfg.members[2].host = "${SLAVE2_IP}"
    rs.reconfig(cfg)
EOF

mongo << EOF
    use admin
    db.createUser({user:"admin",pwd:"${MONGO_PWD}",roles:[{role:"root",db:"admin"}]})
EOF
