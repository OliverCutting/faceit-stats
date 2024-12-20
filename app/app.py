from flask import Flask
import main
import os

app = Flask(__name__)

@app.route("/test")
def test():
    return "Hello World!"

@app.route("/")
def home():
  return f"Mean kills = {main.mean_kills(os.environ['TEST_USER'])}\n Median kills = {main.median_kills(os.environ['TEST_USER'])}"

if __name__ == "__main__":
  app.run()