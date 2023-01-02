package utils

import (
	"io/fs"
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
