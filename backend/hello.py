from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>", 200

@app.route("/health")
def health_check():
    return { "status": "ok" }, 200