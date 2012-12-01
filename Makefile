OUTPUT_DIR = "build"

all: lint build
lint: lint-html lint-css
build: html css

html:
	mkdir -p $(OUTPUT_DIR)
	jade < src/html/index.jade > $(OUTPUT_DIR)/index.html

css:
	mkdir -p $(OUTPUT_DIR)
	lessc src/css/index.less > $(OUTPUT_DIR)/index.css

lint-html:
	jade < src/html/index.jade > /dev/null

lint-css:
	lessc src/css/index.less > /dev/null

.PHONY:
