FROM alpine:edge

RUN apk add --no-cache curl lighttpd

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY index.html /var/www/servers/www.example.org/pages/index.html

HEALTHCHECK --interval=2m --timeout=1s --retries=1 CMD curl --fail http://localhost:3000/index.html || exit 1

ENTRYPOINT [ "lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf" ]