.PHONY: all clean release

APP=amnesia
OUT=bin

GARBLE=${GOPATH}/bin/garble
BUILD=garble -tiny build

PLATFORMS = linux windows darwin
os = $(word 1, $@)

all: ${PLATFORMS}

${PLATFORMS} $(GARBLE):
	GOOS=${os} ${BUILD} -o ${OUT}/${APP}-${os}

release: all
	@tar -czvf ${APP}.tar.gz ${OUT}

clean: 
	rm -rf ${OUT}*

$(GARBLE):
	go get mvdan.cc/garble
