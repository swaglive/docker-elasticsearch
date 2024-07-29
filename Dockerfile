ARG     gradle_version=5.6.4
ARG     version=
ARG     base=elasticsearch:${version}

### 

FROM    gradle:${gradle_version} AS elasticsearch-jieba
ARG     version

WORKDIR /

RUN     wget -O- https://github.com/sing1ee/elasticsearch-jieba-plugin/archive/v${version}.tar.gz | tar xz

WORKDIR elasticsearch-jieba-plugin-${version}

RUN     gradle pz && \
        mkdir -p /usr/share/elasticsearch/plugins/jieba && \
        unzip build/distributions/elasticsearch-jieba-plugin-${version}.zip -d /usr/share/elasticsearch/plugins/jieba

###
FROM    ${base}
ARG     version

COPY    --from=elasticsearch-jieba --chown=elasticsearch:elasticsearch /usr/share/elasticsearch/plugins/jieba /usr/share/elasticsearch/plugins/jieba

RUN     /usr/share/elasticsearch/bin/elasticsearch-plugin install \
        https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-smartcn/analysis-smartcn-${version}.zip
