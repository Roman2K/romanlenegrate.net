all: lint build
lint: lint-html lint-css
build: html css img

html:
	jade < src/html/index.jade > build/index.html

css:
	lessc src/css/index.less > build/index.css

img: .PHONY
	bin/img-make rss blog
	bin/img-make github_alt github
	bin/img-make facebook_alt facebook
	bin/img-make soundcloud soundcloud
	bin/img-make vcard e-mail

lint-html:
	jade < src/html/index.jade > /dev/null

lint-css:
	lessc src/css/index.less > /dev/null

.PHONY:
