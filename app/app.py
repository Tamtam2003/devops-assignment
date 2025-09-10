from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    return f"Hello from Flask on EKS! Project: {os.getenv('PROJECT_NAME', 'hello-eks')}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
