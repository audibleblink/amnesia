package main

import (
	"crypto/rand"
	"fmt"
	"io"

	"github.com/shirou/gopsutil/mem"
)

var (
	times     = 3
	writeSize = uint64(1)
)

func main() {
	totalMem, _ := mem.VirtualMemory()
	maxMemWrite := totalMem.Available / 2
	for times > 0 {
		for writeSize <= maxMemWrite {
			overwriteBytes(writeSize)
			writeSize = writeSize * 2
		}
		writeSize = uint64(1)
		times--
	}
}

func overwriteBytes(bytesToFill uint64) {
	fmt.Printf("%d", bytesToFill)
	vessel := make([]byte, bytesToFill)
	io.ReadFull(rand.Reader, vessel)
}
