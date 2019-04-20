
# hnlog Makefile

USERNAME:=westurner

default: backup

install:
	pip install -e git+https://github.com/westurner/dlhn#egg=dlhn

backup:
	@# items with a cachetime newer than 14d ago may need to be pulled again
	@# because they may not be locked yet (cachetime != item_time)
	dlhn -u '$(USERNAME)' -o index.html --expire-newerthan 14d

backup-nocache:
	dlhn -u '$(USERNAME)' -o index.html

commit:
	git add ./index.html ./index.html.json ./dlhn.sqlite && \
	git commit -m ":books: Updated index.html, index.html.json, and dlhn.sqlite"

push:
	git push

all: backup commit push
