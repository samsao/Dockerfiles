###
# Order of instructions has an importance regarding the caching
# of different layers. You need to know that each instruction
# creates a new layer that can be re-used later. So the idea
# is to order instructions from less varying to most varying
# so intermediate layers can be re-used.

FROM prom/node-exporter:v0.15.2
LABEL maintainer="mvachon@samsao.co"

USER root
COPY conf /etc/node-exporter/

ENV NODE_ID=none

ENTRYPOINT [ "/etc/node-exporter/docker-entrypoint.sh" ]
