SHELL=/bin/bash

NODE=node
TIDY=tidy

# markpress executable generated by @make deps
MARKPRESS_BIN=./node_modules/markpress/bin/markpress.js
# The impress.js generated layout [horizontal (default)|vertical|3d-push|3d-pull|grid|random-7d|random]
MARKPRESS_LAYOUT=3d-push

INPUT=presentation.md
OUTPUT=index.html

build:
	# Build impress.js HTML from Markdown source
	${NODE} --harmony ${MARKPRESS_BIN} --layout ${MARKPRESS_LAYOUT} --input ${INPUT} --output ${OUTPUT}
	# Trigger build error when tidy return code is not 0 or 1
	# http://unix.stackexchange.com/questions/153763/dont-stop-makeing-if-a-command-fails-but-check-exit-status
	$(TIDY) -utf8 -modify -indent -wrap 0 ${OUTPUT} ; \
	if [ $$? -eq 0 -o $$? -eq 1 ] ; then exit 0 ; else exit 1 ; fi ;

deps:
	sudo aptitude install npm
	npm install markpress

