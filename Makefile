mmark=mmark
xml2rfc=xml2rfc

all: happy-stubs.html happy-stubs.txt

happy-stubs.xml: happy-stubs.md
	$(mmark) -page -xml2 happy-stubs.md > happy-stubs.xml

happy-stubs.html: happy-stubs.xml
	$(xml2rfc) --html happy-stubs.xml

happy-stubs.txt: happy-stubs.xml
	$(xml2rfc) --text happy-stubs.xml

clean:
	rm -f happy-stubs.{txt,html,xml}
