PYTHON=`which python3`
DESTDIR=/
BUILDIR=$(CURDIR)/debian/flask_fastrpc
PROJECT=python3-flask-fastrpc

source:
	python3 setup.py sdist

upload:
	python3 setup.py sdist
	python3 setup.py bdist_wheel
	python3 setup.py bdist
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
