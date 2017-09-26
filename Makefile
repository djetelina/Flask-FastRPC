PYTHON=`which python3`
DESTDIR=/
BUILDIR=$(CURDIR)/debian/flask_fastrpc
PROJECT=python3-flask-fastrpc

source:
	python3 setup.py sdist

upload:
	rm dist/*
	python3 setup.py sdist
	python3 setup.py bdist_wheel
	twine upload dist/*
	python3 setup.py clean

install:
	python3 setup.py install --root ($DESTDIR)

install-building-packages:
	apt-get install build-essential dh-make debhelper devscripts cdbs

builddeb:
	# build the source package in the parent directory
	# then rename it to project_version.orig.tar.gz
	python3 setup.py sdist --dist-dir=../
	rename -f 's/$(PROJECT)-(.*)\.tar\.gz/$(PROJECT)_$$1\.orig\.tar\.gz/' ../*
	# build the package
	dpkg-buildpackage -uc -us -i -I -rfakeroot

lint:
	python3 -m mypy flask_fastrpc.py --ignore-missing-imports
	python3 -m flake8 flask_fastrpc.py --ignore E501,F401
