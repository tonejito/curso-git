SHELL=/bin/bash

NODE=node
TIDY=tidy

MARKPRESS_BIN=./node_modules/markpress/bin/markpress.js

INPUT=presentation.md
OUTPUT=index.html

build:
	${NODE} --harmony ${MARKPRESS_BIN} -i ${INPUT} -o ${OUTPUT}
	$(TIDY) -modify -indent -wrap 0 ${OUTPUT}

deps:
	sudo aptitude install npm
	npm install markpress

