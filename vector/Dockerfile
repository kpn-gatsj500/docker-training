FROM alpine:edge

RUN apk add --no-cache curl bash && \ 
    curl --proto '=https' --tlsv1.2 -sSfL https://sh.vector.dev | bash -s -- -y --prefix /usr/local


ENTRYPOINT ["tail", "-F", "/dev/null"]