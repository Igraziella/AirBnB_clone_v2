#!/usr/bin/python3
""" A script thats starts a Flask application
"""


from flask import Flask
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello():
    """ Displays Hello HBNB on port 5000 """
    return "Hello HBNB!"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
