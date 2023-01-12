package utils

import (
	"fmt"
	"strings"
)

type StringBuilder struct {
	builder strings.Builder
}

func (sb *StringBuilder) Len() int {
	return sb.builder.Len()
}

func (sb *StringBuilder) WriteString(s string) *StringBuilder {
	sb.builder.WriteString(s)
	return sb
}

func (sb *StringBuilder) WriteStringf(format string, a ...any) *StringBuilder {
	return sb.WriteString(fmt.Sprintf(format, a...))
}

func (sb *StringBuilder) WriteLinef(format string, a ...any) *StringBuilder {
	return sb.WriteLine(fmt.Sprintf(format, a...))
}

func (sb *StringBuilder) WriteLine(s string) *StringBuilder {
	if s == "" {
		return sb
	}
	sb.builder.WriteString(s)
	return sb.WriteNewLine()
}

func (sb *StringBuilder) WriteNewLine() *StringBuilder {
	sb.builder.WriteString(NewLine)
	return sb
}

func (sb *StringBuilder) WriteHorizontalDivider() *StringBuilder {
	sb.builder.WriteString(HorizontalDivider)
	return sb.WriteNewLine()
}

func (sb *StringBuilder) Reset() {
	sb.builder.Reset()
}

func (sb *StringBuilder) String() string {
	return sb.builder.String()
}
