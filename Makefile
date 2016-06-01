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
	${NODE} --harmony ${MARKPRESS_BIN} --input ${INPUT} --output ${OUTPUT} --no-embed --layout ${MARKPRESS_LAYOUT}

deps:
	sudo aptitude install npm
	npm install markpress

