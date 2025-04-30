FROM alpine:edge

RUN apk add --no-cache curl python3 py3-flask

WORKDIR /usr/src/app
COPY hello.py ./

ENTRYPOINT ["python", "-m", "flask", "--app", "hello", "run", "--host=0.0.0.0"]