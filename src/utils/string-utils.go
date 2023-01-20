package utils

import "strings"

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
