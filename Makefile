DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man

PROG=	qm4

ifdef DEBUG
	CFLAGS+=-DDEBUG -g
endif

OBJS=eval.o expr.o look.o main.o misc.o gnum4.o trace.o

$(PROG): $(OBJS)
	$(CC) $(LDFLAGS) -o $(PROG) $(OBJS)

clean:
	rm -f $(PROG) $(OBJS)

install-bin:
	install -D qm4 $(DESTDIR)$(BINDIR)/qm4

install-man:
	install -D m4.1 $(DESTDIR)$(MANDIR)/man1/qm4.1

install: install-bin install-man
