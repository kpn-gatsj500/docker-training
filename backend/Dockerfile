FROM alpine:edge

RUN apk add --no-cache curl python3 py3-flask

WORKDIR /usr/src/app
COPY hello.py ./

HEALTHCHECK --interval=2m --timeout=1s --retries=1 CMD curl --fail http://localhost:5000 || exit 1

ENTRYPOINT ["python", "-m", "flask", "--app", "hello", "run", "--host=0.0.0.0"]