FROM openjdk:8-alpine

LABEL maintainer="shadock<hushuang123a@gmail.com>"

ENV version=2.0.3

ENV ZK_SERVER=127.0.0.1:2181
ENV PORT=8080
ENV ADMIN=admin
ENV PASSWORD=8a9a5d9c6bd2b15c8c
ENV KE_HOME=/kafka-eagle

RUN apk update && \
        apk add curl sqlite && \
        curl -OL "https://github.com/smartloli/kafka-eagle-bin/archive/v${version}.tar.gz" && \
        tar -xzvf v${version}.tar.gz && \
        tar -xzvf kafka-eagle-bin-${version}/kafka-eagle-web-${version}-bin.tar.gz && \
        mv kafka-eagle-web-${version} /kafka-eagle && \
        rm -rf $v{version}.tar.gz kafka-eagle-bin-${version}
WORKDIR /kafka-eagle

COPY system-config.properties ./conf/system-config.properties
COPY entrypoint.sh ./bin/entrypoint.sh

VOLUME [ "/kafka-eagle/db" ]

CMD ["sh", "/kafka-eagle/bin/entrypoint.sh"]