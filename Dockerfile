ARG BASE=docker:19.03-rc-dind
FROM ${BASE}

RUN apk --update --no-cache add \
    bash \
    supervisor \
    openssh \
 && mkdir -p /var/log/supervisor \
 && ln -s /usr/local/bin/docker /usr/bin/docker

COPY files /
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
