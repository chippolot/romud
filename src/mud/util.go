package mud

import (
	"io/ioutil"
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

	bytes, err := ioutil.ReadAll(file)
	if err != nil {
		return nil, err
	}
	return bytes, nil
}
