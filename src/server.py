# coding: utf-8
from flask import Flask, render_template, request, jsonify
from importlib import import_module
import os

app = Flask(__name__)

@app.route('/', methods=['GET'])
def root():
    m = import_module('PyTorch-YOLOv3.detect')
    return m.execute()

@app.route('/<userid>', methods=['DETECT'])
def detect(userid):
    m = import_module('%s.detect' % userid)
    return m.execute()

if __name__ == "__main__":
    app.run("0.0.0.0", 5000, threaded=True, debug=False)
