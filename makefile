version = 0_0_00
outfile = JTLShop_nl2go_$(version).zip

$(version): $(outfile)

$(outfile): tmp/build.zip
	mv tmp/build.zip $(outfile)

tmp/build.zip: tmp/newsletter2go/info.xml
	cd tmp/ && zip -r build.zip newsletter2go/

tmp/newsletter2go/info.xml: tmp/newsletter2go
	cp -R src/* tmp/newsletter2go

tmp/newsletter2go:
	mkdir -p tmp/newsletter2go

.PHONY: clean
clean:
	rm -rf tmp
