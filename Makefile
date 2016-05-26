SHELL=/bin/bash

NODE=node
TIDY=tidy

MARKPRESS_BIN=./node_modules/markpress/bin/markpress.js

INPUT=presentation.md
OUTPUT=index.html

build:
	${NODE} --harmony ${MARKPRESS_BIN} -i ${INPUT} -o ${OUTPUT}
	# Trigger build error when tidy return code is not 0 or 1
	# http://unix.stackexchange.com/questions/153763/dont-stop-makeing-if-a-command-fails-but-check-exit-status
	$(TIDY) -modify -indent -wrap 0 ${OUTPUT} ; \
	if [ $$? -eq 0 -o $$? -eq 1 ] ; then exit 0 ; else exit 1 ; fi ;

deps:
	sudo aptitude install npm
	npm install markpress

