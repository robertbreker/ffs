.PHONY: clean
clean:

DESTDIR?=/
SCRIPTDIR?=/usr/libexec/xapi-storage-script
PYTHONDIR?=/usr/lib/python2.7/site-packages/xapi
XAPIPLUGINDIR?=/etc/xapi.d/plugins

.PHONY: install
install:
	mkdir -p $(DESTDIR)$(SCRIPTDIR)/datapath/
	cp -rf datapath/* $(DESTDIR)$(SCRIPTDIR)/datapath/
	chmod 0755 $(DESTDIR)$(SCRIPTDIR)/datapath/*/*
	mkdir -p  $(DESTDIR)$(SCRIPTDIR)/volume/
	cp -rf volume/* $(DESTDIR)$(SCRIPTDIR)/volume/
	chmod 0755 $(DESTDIR)$(SCRIPTDIR)/volume/*/*
	mkdir -p $(DESTDIR)$(PYTHONDIR)
	install -m 0755 -D $(wildcard lib/*.py) $(DESTDIR)$(PYTHONDIR)
	mkdir -p $(DESTDIR)$(XAPIPLUGINDIR)
	install -m 0755 -D $(wildcard overlay$(XAPIPLUGINDIR)/*) $(DESTDIR)$(XAPIPLUGINDIR)
