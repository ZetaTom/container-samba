FROM alpine:latest

COPY entrypoint.sh /opt

RUN apk add --no-cache \
        bash \
        samba-common-tools \
        samba-server && \
    rm -rf /var/cache/apk/* && \
    chmod +x /opt/entrypoint.sh

VOLUME /mnt

EXPOSE 445/tcp

ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["/usr/sbin/smbd", "--foreground", "--no-process-group", "--debug-stdout"]
