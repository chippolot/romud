package utils

import "strings"

const NewLine = "\n\r"
const HorizontalDivider = "---------------------------------"

func LineBreak(str string, maxLen int, delimeter string) []string {
	if len(str) <= maxLen {
		return []string{str}
	}

	var sb StringBuilder
	lines := make([]string, 0)
	toks := strings.Split(str, delimeter)

	for idx, s := range toks {
		if sb.Len()+len(s) > maxLen {
			lines = append(lines, sb.String())
			sb.Reset()
		}
		sb.WriteStringf(s)
		if idx != len(toks)-1 {
			sb.WriteString(delimeter)
		}
	}
	lines = append(lines, sb.String())
	return lines
}
