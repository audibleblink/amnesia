.PHONY: all clean release

APP=amnesia
OUT=release
FLAGS=-trimpath -ldflags="-s -w -buildid="

PLATFORMS = linux windows darwin
os = $(word 1, $@)

all: ${PLATFORMS}

${PLATFORMS}:
	GOOS=${os} \
	     go build ${FLAGS} -o ${OUT}/${APP}-${os}

release: all
	@tar -czvf ${OUT}.tar.gz ${OUT}

clean: 
	rm -rf ${OUT}*
