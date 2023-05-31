OUTPUT_DIR = "build"
NODE_BIN = node_modules/.bin
JADE = "${NODE_BIN}/jade"
LESSC = "${NODE_BIN}/jade"

all: lint build
lint: lint-html lint-css
build: html css

html:
	mkdir -p $(OUTPUT_DIR)
	$(JADE) < src/html/index.jade > $(OUTPUT_DIR)/index.html

css:
	mkdir -p $(OUTPUT_DIR)
	lessc src/css/index.less > $(OUTPUT_DIR)/index.css

lint-html:
	$(JADE) < src/html/index.jade > /dev/null

lint-css:
	$(LESSC) src/css/index.less > /dev/null

serve:
	cd build && python3 -m http.server 8585

.PHONY:
