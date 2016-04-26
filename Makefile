source := $(shell dpkg-parsechangelog | awk '$$1 == "Source:" { print $$2 }')
version := $(shell dpkg-parsechangelog | awk '$$1 == "Version:" { print $$2 }')
target_distribution := $(shell dpkg-parsechangelog | awk '$$1 == "Distribution:" { print $$2 }')

.PHONY: all
all:

.PHONY: install
install:
	install -d $(DESTDIR)/usr/sbin/
	install apt-checkupdates $(DESTDIR)/usr/sbin/

.PHONY: check-target
check-target:
	@test "$(target_distribution)" = "precise" || { \
	    echo "Distribution in debian/changelog should be 'precise'" 2>&1; \
	    echo 'Run dch -r -D precise ""' 2>&1; \
	    exit 1; \
	}

.PHONY: source-package
source-package:
	debuild -S -i -k$(GPGKEY)

.PHONY: upload-to-ppa
release upload-to-ppa: check-target source-package
	dput ppa:pov/ppa ../$(source)_$(version)_source.changes
	git tag $(version)
	git push
	git push --tags

.PHONY: binary-package
binary-package:
	debuild -i -k$(GPGKEY)
