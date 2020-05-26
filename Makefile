# Makefile

BACKUPDIR = $(PWD)/backup.d
CONFDIR   = $(PWD)/conf.d
HOMEDIR   = $(HOME)

dotfiles = $(shell ls -1 conf.d/)
dotlinks = $(addprefix $(HOMEDIR)/.,$(dotfiles))

.PHONY: all
all: uninstall backup install

.PHONY: backup
backup:
	[ ! -d $(BACKUPDIR) ] && mkdir backup.d || :
	for i in $(dotfiles); do \
		if [ -f $(HOME)/.$$i ] || [ -d $(HOME)/.$$i ]; then \
			mv --verbose  $(HOME)/.$$i $(BACKUPDIR)/$$i || exit $$?; \
		fi \
	done

.PHONY: clean
clean:
	rm --verbose --force --recursive $(dotlinks)

$(dotlinks): $(addprefix $(HOMEDIR)/.,%) : $(addprefix $(CONFDIR)/,%)
	ln --verbose --symbolic --no-target-directory $< $@

dotfiles: $(dotlinks)

.PHONY: install
install: dotfiles
	chmod 0600 ${CONFDIR}/ssh/config

.PHONY: uninstall
uninstall:
	for i in $(dotlinks); do \
		if [ -L $$i ]; then \
			rm --verbose $$i || exit $$? ; \
		fi \
	done

