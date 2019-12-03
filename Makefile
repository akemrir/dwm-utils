package = dwm-utils
binscripts = dwm-cmd.sh dwm-status.sh dwm-wallpaper.sh fmenu.sh
scripts = appsmenu.sh backlight.sh docsmenu.sh quitmenu.sh quit.sh \
          rfkill.sh screenlock.sh screenshot.sh terminal.sh \
          touchpad.sh videomenu.sh volume.sh
distfiles = Makefile $(binscripts) $(scripts) README

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libexecdir = $(exec_prefix)/libexec
scriptsdir = $(libexecdir)/$(package)


.PHONY: all check dist clean distclean install uninstall

all:

check:

dist:
	rm -R -f $(package) $(package).tar $(package).tar.gz
	mkdir $(package)
	cp -f $(distfiles) $(package)
	tar -c -f $(package).tar $(package)
	gzip $(package).tar
	rm -R -f $(package) $(package).tar

clean:
	rm -R -f $(package) $(package).tar $(package).tar.gz

distclean: clean

install: all
	mkdir -p $(DESTDIR)$(bindir)
	sed 's|@libexecdir@|$(scriptsdir)|' dwm-cmd.sh > $(DESTDIR)$(bindir)/dwm-cmd
	cp -f dwm-status.sh $(DESTDIR)$(bindir)/dwm-status
	cp -f dwm-wallpaper.sh $(DESTDIR)$(bindir)/dwm-wallpaper
	cp -f fmenu.sh $(DESTDIR)$(bindir)/fmenu
	cd $(DESTDIR)$(bindir) && chmod +x $(binscripts:.sh=)
	mkdir -p $(DESTDIR)$(scriptsdir)
	cp -f appsmenu.sh $(DESTDIR)$(scriptsdir)/appsmenu
	cp -f backlight.sh $(DESTDIR)$(scriptsdir)/backlight
	cp -f docsmenu.sh $(DESTDIR)$(scriptsdir)/docsmenu
	cp -f quitmenu.sh $(DESTDIR)$(scriptsdir)/quitmenu
	cp -f quit.sh $(DESTDIR)$(scriptsdir)/quit
	cp -f rfkill.sh $(DESTDIR)$(scriptsdir)/rfkill
	cp -f screenlock.sh $(DESTDIR)$(scriptsdir)/screenlock
	cp -f screenshot.sh $(DESTDIR)$(scriptsdir)/screenshot
	cp -f terminal.sh $(DESTDIR)$(scriptsdir)/terminal
	cp -f touchpad.sh $(DESTDIR)$(scriptsdir)/touchpad
	cp -f videomenu.sh $(DESTDIR)$(scriptsdir)/videomenu
	cp -f volume.sh $(DESTDIR)$(scriptsdir)/volume
	cd $(DESTDIR)$(scriptsdir) && chmod +x $(scripts:.sh=)

uninstall:
	cd $(DESTDIR)$(bindir) && rm -f $(binscripts:.sh=)
	cd $(DESTDIR)$(scriptsdir) && rm -f $(scripts:.sh=)
