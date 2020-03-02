.PHONY: windows linux darwin

FLAGS=-ldflags="-s -w -buildid=" -trimpath
BUILD=go build -a
OUT=bin

all: windows linux darwin

clean: 
	rm -rf ${OUT}

windows:
	$(eval GOOS=windows)
	${BUILD} ${FLAGS} -o ${OUT}/${GOOS}.exe

linux:
	$(eval GOOS=linux)
	${BUILD} ${FLAGS} -o ${OUT}/${GOOS}

darwin:
	$(eval GOOS=darwin)
	${BUILD} ${FLAGS} -o ${OUT}/${GOOS}

