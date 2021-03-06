# Time-stamp: <2009-10-29 07:31:52 rsmith>
# This is the Makefile for stl2pov

# Define the C compiler to be used, usually gcc.
#CC = gcc

# Package name and version: BASENAME-VMAJOR.VMINOR.VPATCH.tar.gz
BASENAME = stl2pov
.include "version.inc"

# Add appropriate CFLAGS and LFLAGS
CFLAGS ?= -O2 -pipe
CFLAGS += -Wall -Wshadow -Wpointer-arith -Wstrict-prototypes
CFLAGS += -fmerge-constants -ffast-math -DNDEBUG
LFLAGS += -s -pipe -fmerge-constants

# Other libraries to link against
LIBS += -lm

# Base directory
PREFIX ?= /usr/local

# Location where the binary will be installed.
BINDIR = $(PREFIX)/bin

# Location where the manual-page will be installed.
MANDIR = $(PREFIX)/man

# Location where the documentation will be installed.
DOCSDIR= $(PREFIX)/share/doc/$(BASENAME)

##### Maintainer stuff goes here:

# Standard files that need to be included in the distribution
DISTFILES = README INSTALL LICENSE Makefile $(BASENAME).1 depend version.inc

# Source files.
SRCS = license.c parse.c stl2pov.c utils.c

# Extra stuff to add into the distribution.
XTRA_DIST=

##### No editing necessary beyond this point
# Object files.
OBJS = $(SRCS:.c=.o)

# Predefined directory/file names
PKGDIR  = $(BASENAME)-$(VMAJOR).$(VMINOR).$(VPATCH)
TARFILE = $(PKGDIR).tar.gz

# Version number
VERSION = -DVERSION=\"$(VMAJOR).$(VMINOR).$(VPATCH)\"
# Program name
PACKAGE = -DPACKAGE=\"$(BASENAME)\"
# Add to CFLAGS
CFLAGS += $(VERSION) $(PACKAGE)

.PHONY: clean install uninstall dist all log winbin

all: $(BASENAME) $(BASENAME).1 README INSTALL

# builds a binary.
$(BASENAME): $(OBJS)
	$(CC) $(LFLAGS) $(LDIRS) -o $(BASENAME) $(OBJS) $(LIBS)

# Remove all generated files.
clean:;
	rm -f $(OBJS) $(BASENAME) *~ core gmon.out $(TARFILE)* \
	$(LOG)


# Install the program and manual page. You should be root to do this.
install: $(BASENAME) $(BASENAME).1 LICENSE README INSTALL $(LOG)
	@if [ `id -u` != 0 ]; then \
		echo "You must be root to install the program!"; \
		exit 1; \
	fi
	install -d $(BINDIR)
	install -m 755 $(BASENAME) $(BINDIR)
	install -d $(MANDIR)/man1
	install -m 644 $(BASENAME).1 $(MANDIR)/man1
	gzip -f $(MANDIR)/man1/$(BASENAME).1
.if !defined(NOPORTDOCS)
	install -d $(DOCSDIR)
	install -m 644 LICENSE README INSTALL $(LOG) $(DOCSDIR)
.endif

uninstall:;
	@if [ `id -u` != 0 ]; then \
		echo "You must be root to uninstall the program!"; \
		exit 1; \
	fi
	rm -f $(BINDIR)/$(BASENAME)
	rm -f $(MANDIR)/man1/$(BASENAME).1*
	rm -rf $(DOCSDIR)

# Dependencies after this line.
include depend
