OUTPUT_DIR = "build"
IMG_OUTPUT_DIR = $(OUTPUT_DIR)/img

all: lint build
lint: lint-html lint-css
build: html css img

html:
	mkdir -p $(OUTPUT_DIR)
	jade < src/html/index.jade > $(OUTPUT_DIR)/index.html

css:
	mkdir -p $(OUTPUT_DIR)
	lessc src/css/index.less > $(OUTPUT_DIR)/index.css

img: .PHONY
	mkdir -p $(IMG_OUTPUT_DIR)
	bin/img-make rss 					blog 				$(IMG_OUTPUT_DIR)
	bin/img-make github_alt 	github 			$(IMG_OUTPUT_DIR)
	bin/img-make facebook_alt facebook 		$(IMG_OUTPUT_DIR)
	bin/img-make soundcloud 	soundcloud 	$(IMG_OUTPUT_DIR)
	bin/img-make vcard 				e-mail 			$(IMG_OUTPUT_DIR)

lint-html:
	jade < src/html/index.jade > /dev/null

lint-css:
	lessc src/css/index.less > /dev/null

.PHONY:
