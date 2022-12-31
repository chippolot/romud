package mud

import (
	"io"
	"os"
)

const InvalidId = 0
const InvalidName = ""

func LoadFileBytes(path string) ([]byte, error) {
	file, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	bytes, err := io.ReadAll(file)
	if err != nil {
		return nil, err
	}
	return bytes, nil
}

func maxInts(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func minInts(a, b int) int {
	if a < b {
		return a
	}
	return b
}
