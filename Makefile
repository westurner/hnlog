
# hnlog Makefile

_SRC:= '..'

default: backup

install:
	cd '$(_SRC)' && git clone https://github.com/westurner/dlhn
	conda env update -f '$(_SRC)/environment.yml'

backup:
	python '$(_SRC)/dlhn/dlhn/dlhn.py' -u westurner -o index.html

commit:
	git add ./index.html ./index.html.json ./dlhn.sqlite && \
	git commit -m ":books: Updated index.html, index.html.json, and dlhn.sqlite"

push:
	git push

all: backup commit push
