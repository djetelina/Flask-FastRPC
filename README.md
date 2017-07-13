# Flask-FastRPC

Simple Flask extension that allows it to be used as a [fastrpc](https://seznam.github.io/frpc/)/xmlrpc server.

Requires Python 3.4+

## Install

`pip3 install flask-fastrpc`

## Use

### Run server

The simple way.

```python
import flask
from flask_fastrpc import FastRPCHandler

app = flask.Flask(__name__)
rpc = FastRPCHandler(app)


def add(a, b):
    return a + b

rpc.register_method('add', add)

app.run(port=5000)
```

#### Additional keyword arguments

* `register_intrispection_methods` whether to register `system.listMethods` and `system.methodHelp`, default `True`
* `allowed_content_types` - list of strings,  by default `application/x-frpc` and `text/xml`. frpc is added only when fastrpc is succesfully imported
* `url` - which url to register as a RPC handler, by default `/RPC2`

### Run server's method

Using fastrpc

```python
>>> import fastrpc
>>> my_server = fastrpc.ServerProxy('http://localhost:5000/RPC2')
>>> my_server.add(3, 5)
8
```

or alternatively using builtin xmlrpc client

```python
>>> from xmlrpc import client
>>> my_server = client.ServerProxy('http://localhost:5000/RPC2')
>>> my_server.add(3, 5)
8
```

## Features

* When fastrpc fails to import, xmlrpc is used
* Enforcing type check from annotations during runtime (can be turned off)
* When returning a dictionary, automatically adds keys `{status: 200, statusMessage: 'ok'}` to it (when not present)