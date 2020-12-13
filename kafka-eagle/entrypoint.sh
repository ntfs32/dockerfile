#!/bin/bash

echo "[计] configuration file is: /kafka-eagle/conf/system-config.properties"
chmod +x /kafka-eagle/bin/ke.sh
mkdir -p /kafka-eagle/db/
sh /kafka-eagle/bin/ke.sh start
tail -f /kafka-eagle/logs/log.log