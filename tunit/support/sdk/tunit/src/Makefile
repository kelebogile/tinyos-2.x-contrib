# Top-level Makefile for tools/java

SUBDIRS = com

JAVADOCDIR = ../doc/javadoc

ROOT = .
include $(ROOT)/Makefile.include

tunit.jar: all
	rm -f ../tunit.jar
	@# create the jar, as update requires it to exist. we use a
	@# .class file we assume always exists
	find . | grep -E "class|jpg|gif" | xargs jar cf ../tunit.jar


javadoc: all
	rm -rf $(JAVADOCDIR)
	mkdir -p $(JAVADOCDIR)
	javadoc -d $(JAVADOCDIR) `find -name *.java`
