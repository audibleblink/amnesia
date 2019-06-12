package main

import (
	"crypto/rand"
	"io"
	"log"

	"github.com/shirou/gopsutil/mem"
)

var times = 3

func main() {
	v, _ := mem.VirtualMemory()

	for times > 0 {
		bytesToFill := v.Available / 2
		log.Println("Filling: ", bytesToFill)
		vessel := make([]byte, bytesToFill)
		_, err := io.ReadFull(rand.Reader, vessel)
		if err != nil {
			log.Fatal(err)
		}

		times--
	}
}
