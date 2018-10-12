ARG BASE=docker:18.09-rc-dind
FROM ${BASE}

RUN apk --update --no-cache add \
    bash \
    py-pip \
    supervisor \
    openssh \
    curl \
 && pip install docker-compose \
 && mkdir -p /var/log/supervisor

COPY files /
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
