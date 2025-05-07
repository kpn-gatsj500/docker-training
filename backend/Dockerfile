FROM alpine:edge

RUN apk add --no-cache curl python3 py3-flask

WORKDIR /usr/src/app
COPY hello.py ./

HEALTHCHECK --interval=60s --timeout=1s --retries=1 --start-interval=1s --start-period=30s CMD curl --fail http://localhost:5000 || exit 1

ENTRYPOINT ["python", "-m", "flask", "--app", "hello", "run", "--host=0.0.0.0"]