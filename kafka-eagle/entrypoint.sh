#!/bin/bash

echo "configuration file is: /kafka-eagle/conf/system-config.properties"
echo "system admin user: ${ADMIN}"
echo "system admin password: ${PASSWORD}"

sed -i "s/ZK_SERVER/${ZK_SERVER}/g" /kafka-eagle/conf/system-config.properties
sed -i "s/PORT/${PORT}/g" /kafka-eagle/conf/system-config.properties
sed -i "s/ADMIN/${ADMIN}/g" /kafka-eagle/conf/system-config.properties
sed -i "s/PASSWORD/${PASSWORD}/g" /kafka-eagle/conf/system-config.properties

chmod +x /kafka-eagle/bin/ke.sh
mkdir -p /kafka-eagle/db/
sh /kafka-eagle/bin/ke.sh start
tail -f /kafka-eagle/logs/log.log