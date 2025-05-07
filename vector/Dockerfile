FROM alpine:edge

RUN apk add --no-cache curl bash && \ 
    curl --proto '=https' --tlsv1.2 -sSfL https://sh.vector.dev | bash -s -- -y --prefix /usr/local

HEALTHCHECK --interval=60s --timeout=1s --retries=1 --start-interval=1s --start-period=30s CMD curl --fail http://localhost:8686/health || exit 1

ENTRYPOINT ["vector"]
# ENTRYPOINT ["tail", "-F", "/dev/null"]