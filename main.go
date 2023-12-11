package main

import (
	"crypto/rand"
	"flag"
	"fmt"
	"github.com/shirou/gopsutil/mem"
	"io"
)

var (
	//times     = 3
	writeSize = uint64(1)
)

func main() {
	totalMem, _ := mem.VirtualMemory()
	maxMemWrite := totalMem.Available / 2
	setTimes := flag.Int("n", 3, "integer, please")
	flag.Parse()
	for *setTimes > 0 {
		for writeSize <= maxMemWrite {
			overwriteBytes(writeSize)
			writeSize = writeSize * 2
		}
		writeSize = uint64(1)
		*setTimes--
	}
}

func overwriteBytes(bytesToFill uint64) {
	fmt.Printf("%d", bytesToFill)
	vessel := make([]byte, bytesToFill)
	io.ReadFull(rand.Reader, vessel)
}
