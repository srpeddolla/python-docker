from app import app
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello World from Hasura"

if __name__ == '__main__':
	app.run()
