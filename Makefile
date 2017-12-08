
# hnlog Makefile

_SRC:= '..'

default: backup

install:
	cd '$(_SRC)' && git clone https://github.com/westurner/dlhn
	conda env update -f '$(_SRC)/environment.yml'

backup:
	@# items with a cachetime newer than 14d ago may need to be pulled again
	@# because they may not be locked yet (cachetime != item_time)
	python '$(_SRC)/dlhn/dlhn/dlhn.py' -u westurner -o index.html --expire-newerthan 14d

commit:
	git add ./index.html ./index.html.json ./dlhn.sqlite && \
	git commit -m ":books: Updated index.html, index.html.json, and dlhn.sqlite"

push:
	git push

all: backup commit push
