ARG     version=
ARG     base=elasticsearch:${version}

### 

FROM    gradle:5.4.1 as jieba

ARG     version=latest

WORKDIR /

RUN     wget -O- https://github.com/sing1ee/elasticsearch-jieba-plugin/archive/v${version}.tar.gz | tar xz

WORKDIR elasticsearch-jieba-plugin-${version}

RUN     gradle pz && \
        mkdir -p /usr/share/elasticsearch/plugins/jieba && \
        unzip build/distributions/elasticsearch-jieba-plugin-${version}.zip -d /usr/share/elasticsearch/plugins/jieba

###

FROM    ${base}

COPY    --from=jieba --chown=elasticsearch:elasticsearch /usr/share/elasticsearch/plugins/jieba /usr/share/elasticsearch/plugins/jieba
