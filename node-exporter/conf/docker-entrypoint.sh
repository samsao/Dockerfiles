#!/bin/sh -e

echo "Entrypoint: Configuring node-exporter node name."
NODE_NAME=$(cat /etc/nodename)
echo "node_meta{\
node_id=\"$NODE_ID\", \
container_label_com_docker_swarm_node_id=\"$NODE_ID\", \
node_name=\"$NODE_NAME\"\
} 1" > /etc/node-exporter/node-meta.prom

echo "Entrypoint: Config written is:"
cat /etc/node-exporter/node-meta.prom
echo ""

echo "About to start node_exporter binary..."
exec /bin/node_exporter "$@"
 