.PHONY: windows linux darwin

# FLAGS=-ldflags "-s -w -buildid= "
FLAGS=-ldflags="-s -w -buildid=" -gcflags=-trimpath=${HOME} -asmflags=-trimpath=${HOME}
BUILD=go build -a
OUT=bin

all: windows linux darwin

windows:
	$(eval GOOS=windows)
	${BUILD} ${FLAGS} -o ${OUT}/${GOOS}.exe

linux:
	$(eval GOOS=linux)
	${BUILD} ${FLAGS} -o ${OUT}/${GOOS}

darwin:
	$(eval GOOS=darwin)
	${BUILD} ${FLAGS} -o ${OUT}/${GOOS}

