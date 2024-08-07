ARG     gradle_version=5.6.4
ARG     version=
ARG     base=elasticsearch:${version}

###
FROM    ${base}
ARG     version

RUN     /usr/share/elasticsearch/bin/elasticsearch-plugin install \
        https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-smartcn/analysis-smartcn-${version}.zip

RUN     /usr/share/elasticsearch/bin/elasticsearch-plugin install -b \
        https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-gcs/repository-gcs-${version}.zip
