## Makefile to install OCS from the sources

.PHONY: install default usage

default: usage

## define these variables to match your system
#.. Path to the source of the distribution
OCSSRC=/home/uebb/kd/ocs/src
#.. Absolute path to the ProjectDefs file in this directory
OCSPROJECT=/home/uebb/kd/ocs/ProjectDefs
#.. Path to the place where the distribution is to be installed
OCSHOME=/home/uebb/kd/ocs-$(VERSION)
#.. Description of your system (see also in $OCSSRC/om/specs/Specs.basic)
#.. use something like `uname -s`-`uname -m`
OSARCH=sol2-sparc
#.. Path to the GNU sed program
SED=/usr/gnu/bin/gsed
#.. Path to the GNU tar program
TAR=/usr/local/bin/gtar
#.. Path to the GNU zip program
GZIP=/usr/local/bin/gzip -f 
#.. Non-vital components of the Opal system
STDPACKAGES =  lib.opal_parserlight lib.opal_readline \
		lib.opal_tcl lib.opal_tk lib.opal_win \
		pkg.browser pkg.emacs pkg.dosfop pkg.doc pkg.ordinatrice \
		pkg.oasys pkg.tivi2 

## don't change anything beyond this line ##############################

#.. Version of the Opal distribution
VERSION=2.3b.beta

#.. name of the distribution archives
SRCDISTR=ocs-$(VERSION)-src
SHAREDDISTR=ocs-$(VERSION)-shared
BINDISTR=ocs-$(VERSION)-bin

#.. Packages which are to be installed (in the given order!)
INITPACKAGES = pkg.om
MINPACKAGES = pkg.opalimports lib.opal_base pkg.genmake \
	      lib.oc_shared lib.oc_oc1 lib.oc_oc2 pkg.oc1 pkg.oc2 
MINSRCPACKAGES	=	pkg.examples
PACKAGES = $(MINPACKAGES) $(STDPACKAGES)


OCSADMIN=$(OCSHOME)/bin/ocsadmin -ocshome $(OCSHOME) -ocssrc $(OCSSRC) -ocsspecs $(OCSSRC)/om/specs
OCSADMININIT=$(OCSSRC)/om/scripts/ocsadmin -ocssrc $(OCSSRC) -ocshome $(OCSHOME) -ocsspecs $(OCSSRC)/om/specs/$(OSARCH)

install: init $(PACKAGES)
	$(OCSADMIN) install $(MINSRCPACKAGES)

init:
	$(OCSADMININIT) init -sed $(SED) $(VERSION)
	$(OCSADMIN) install $(INITPACKAGES)

pkg.% lib.%:
	$(OCSADMIN) ocs $@
	$(OCSADMIN) install $@

boot: $(MINPACKAGES)
	$(OCSADMIN) install $(MINSRCPACKAGES)

complete: $(STDPACKAGES)

distclean:
	$(OCSADMIN) ocs -command cleanobjall $(MINPACKAGES)
	$(OCSADMIN) ocs -command cleanall $(MINSRCPACKAGES) $(STDPACKAGES)

sourcedistr:
	cp -f ignore1  /tmp; cp -f ignore2  /tmp; \
	cd $(OCSSRC)/../.. ; \
	$(TAR) -X /tmp/ignore1 -X /tmp/ignore2 -cvf $(SRCDISTR).tar ocs/src; \
	$(TAR) -X /tmp/ignore1 \
		-X /tmp/ignore2 -rvf $(SRCDISTR).tar ocs/examples; \
	$(TAR) -X /tmp/ignore1 -rvf $(SRCDISTR).tar ocs/doc; \
	$(GZIP) $(SRCDISTR).tar; \
	rm /tmp/ignore1; rm /tmp/ignore2

usage:
	@echo "usage: first edit the variables at the beginning of Makefile"
	@echo "then call 'make install'"