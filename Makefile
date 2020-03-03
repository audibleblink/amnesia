.PHONY: windows linux darwin

FLAGS=-ldflags="-s -w -buildid=" -trimpath
BUILD=go build -a
OUT=bin

all: windows windows32 linux linux32 linux-arm darwin

clean: 
	rm -rf ${OUT}

windows:
	$(eval GOOS=windows)
	$(eval GOARCH=amd64)
	GOOS=${GOOS} GOARCH=${GOARCH} ${BUILD} ${FLAGS} -o ${OUT}/${GOOS}_${GOARCH}.exe

windows32:
	$(eval GOOS=windows)
	$(eval GOARCH=386)
	GOOS=${GOOS} GOARCH=${GOARCH} ${BUILD} ${FLAGS} -o ${OUT}/${GOOS}_${GOARCH}.exe

linux:
	$(eval GOOS=linux)
	$(eval GOARCH=amd64)
	GOOS=${GOOS} GOARCH=${GOARCH} ${BUILD} ${FLAGS} -o ${OUT}/${GOOS}_${GOARCH}

linux32:
	$(eval GOOS=linux)
	$(eval GOARCH=386)
	GOOS=${GOOS} GOARCH=${GOARCH} ${BUILD} ${FLAGS} -o ${OUT}/${GOOS}_${GOARCH}

linux-arm:
	$(eval export GOOS=linux)
	$(eval export GOARCH=arm64)
	GOOS=${GOOS} GOARCH=${GOARCH} ${BUILD} ${FLAGS} -o ${OUT}/${GOOS}_${GOARCH}

darwin:
	$(eval GOOS=darwin)
	$(eval GOARCH=amd64)
	GOOS=${GOOS} GOARCH=${GOARCH} ${BUILD} ${FLAGS} -o ${OUT}/${GOOS}_${GOARCH}.macho


