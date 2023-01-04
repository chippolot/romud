package utils

import (
	"io"
	"io/fs"
	"os"
	"path/filepath"
)

func FindFilePathsWithExtension(root, ext string) []string {
	var ret []string
	_ = filepath.WalkDir(root, func(s string, dir fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if filepath.Ext(dir.Name()) == ext {
			ret = append(ret, s)
		}
		return nil
	})
	return ret
}

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
