# coding: utf-8
from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def root():
    return jsonify(
            {
                'result': 'OK'
            }), 200


if __name__ == "__main__":
    app.run("0.0.0.0", 5000, threaded=True, debug=False)