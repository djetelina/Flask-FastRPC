# coding=utf-8
"""
Flask-FastRPC
-------------

Flask extension that allows it to be used as a fastrpc/xmlrpc server - please visit the HomePage for full readme
"""
import sys
from setuptools import setup

if sys.version_info.major < 3:
    sys.exit('Python 2 is not supported')

requirements = ['Flask', 'typeguard']
if sys.version_info.minor < 5:
    requirements.append('typing>=3.5.2.2')

setup(
    name='Flask-FastRPC',
    version='1.5',
    url='https://github.com/iScrE4m/Flask-FastRPC',
    license='BSD',
    author='David Jetelina',
    author_email='david.jetelina@firma.seznam.cz',
    description='Flask extension for FastRPC/XMLRPC server',
    long_description=__doc__,
    py_modules=['flask_fastrpc'],
    zip_safe=False,
    include_package_data=True,
    platforms='any',
    install_requires=requirements,
    classifiers=[
        'Environment :: Web Environment',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3 :: Only',
        'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
        'Topic :: Software Development :: Libraries :: Python Modules'
    ]
)
