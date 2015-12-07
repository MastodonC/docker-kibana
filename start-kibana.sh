#!/bin/bash

CONFIG_FILE=/kibana-linux-x64/config/kibana.yml

LOG_DIR="/logs/kibana/${HOSTNAME}"
mkdir -p "${LOG_DIR}"

DATA_DIR="/data/kibana/${HOSTNAME}"
mkdir -p ${DATA_DIR}
ES_URL="${ES_SCHEME:-http}://${ES_PORT_9200_TCP_ADDR}:${ES_PORT_9200_TCP_PORT:-9200}"

echo "Elastic Search URL is ${ES_URL}"

cat <<EOF > ${CONFIG_FILE}
port: 5601
host: "0.0.0.0"

# The Elasticsearch instance to use for all your queries.
elasticsearch_url: "${ES_URL}"

bundled_plugin_ids:
 - plugins/dashboard/index
 - plugins/discover/index
 - plugins/doc/index
 - plugins/kibana/index
 - plugins/markdown_vis/index
 - plugins/metric_vis/index
 - plugins/settings/index
 - plugins/table_vis/index
 - plugins/vis_types/index
 - plugins/visualize/index
EOF

/kibana-linux-x64/bin/kibana
