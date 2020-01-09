from flask_cors import CORS
from flask import Flask, jsonify, request
import base64
import darknet
import os
# configuration
DEBUG = True

# instantiate the app
app = Flask(__name__)
app.config.from_object(__name__)
CORS(app)
stats = []

@app.route("/")
def helloWorld():
  return "Hello, cross-origin-world!"

@app.route('/getData', methods=['GET'])
def retrieveData():
    stats = darknet.performDetect(imagePath="./test.jpg")
    return jsonify(stats)

# sanity check route
@app.route('/ping', methods=['GET'])
def ping_pong():
    return jsonify({'data': 'pong!'})

@app.route('/upload', methods=['POST'])
def uploadFile():
    darknet.performDetect(imagePath="./test.jpg")
    with open("result.jpg","rb") as image_file:
        encoded_string = base64.b64encode(image_file.read())
    return encoded_string



if __name__ == '__main__':
   # predict()  
   app.run(host='0.0.0.0', port=8080)
