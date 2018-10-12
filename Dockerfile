ARG BASE=docker:18.09-rc-dind
FROM ${BASE}

RUN apk --update --no-cache add \
    bash \
    py-pip \
    supervisor \
    openssh \
    curl \
 && pip install docker-compose \
 && mkdir -p /var/log/supervisor \
 && ln -s /usr/local/bin/docker /usr/bin/docker

COPY files /
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
