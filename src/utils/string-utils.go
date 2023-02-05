package utils

import (
	"strings"
	"unicode"
)

const NewLine = "\n\r"
const HorizontalDivider = "---------------------------------"

func LineBreak(str string, maxLen int, delimiter string) []string {
	if len(str) <= maxLen {
		return []string{str}
	}

	var sb StringBuilder
	lines := make([]string, 0)
	toks := strings.Split(str, delimiter)

	for idx, s := range toks {
		if sb.Len()+len(s)+1 > maxLen {
			lines = append(lines, sb.String())
			sb.Reset()
		}
		sb.WriteStringf(s)
		if idx != len(toks)-1 {
			sb.WriteString(delimiter)
		}
	}
	lines = append(lines, sb.String())
	return lines
}

func Capitalize(str string) string {
	arr := []rune(str)
	arr[0] = unicode.ToUpper(arr[0])
	return string(arr)
}

type StringMapping[T comparable] struct {
	ToValue  map[string]T
	ToString map[T]string
}

func NewStringMapping[T comparable](mapping map[T]string) *StringMapping[T] {
	ret := &StringMapping[T]{make(map[string]T), mapping}
	for val, str := range mapping {
		ret.ToValue[str] = val
	}
	return ret
}

func SnakeFriendlyTitle(str string) string {
	newWord := true
	strMut := []rune(str)
	for idx, c := range strMut {
		if c == '_' || unicode.IsNumber(c) {
			newWord = true
			continue
		}
		if newWord {
			strMut[idx] = unicode.ToUpper(c)
			newWord = false
		}
	}
	return string(strMut)
}
