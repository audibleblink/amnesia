package main

import (
	"crypto/rand"
	"flag"
	"fmt"
	"github.com/shirou/gopsutil/mem"
	"io"
)

var (
	timesVar int 
	writeSize = uint64(1)
)

func main() {
	totalMem, _ := mem.VirtualMemory()
	maxMemWrite := totalMem.Available / 2
	flag.Parse()
	for timesVar > 0 {
		for writeSize <= maxMemWrite {
			overwriteBytes(writeSize)
			writeSize = writeSize * 2
		}
		writeSize = uint64(1)
		timesVar--
	}
}

func init() {
	flag.IntVar(&timesVar,"n", 1, "integer, please")
}

func overwriteBytes(bytesToFill uint64) {
	fmt.Printf("%d", bytesToFill)
	vessel := make([]byte, bytesToFill)
	io.ReadFull(rand.Reader, vessel)
}

