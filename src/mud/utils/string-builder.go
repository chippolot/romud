package utils

import "strings"

type StringBuilder struct {
	builder strings.Builder
}

func (sb *StringBuilder) WriteString(s string) *StringBuilder {
	sb.builder.WriteString(s)
	return sb
}

func (sb *StringBuilder) WriteLine(s string) *StringBuilder {
	sb.builder.WriteString(s)
	return sb.WriteNewLine()
}

func (sb *StringBuilder) WriteNewLine() *StringBuilder {
	sb.builder.WriteString(NewLine)
	return sb
}

func (sb *StringBuilder) WriteeHorizontalDivider() *StringBuilder {
	sb.builder.WriteString(HorizontalDivider())
	return sb.WriteNewLine()
}

func (sb *StringBuilder) Reset() {
	sb.builder.Reset()
}

func (sb *StringBuilder) String() string {
	return sb.builder.String()
}
