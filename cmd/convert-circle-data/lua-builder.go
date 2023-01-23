package main

import (
	"fmt"
	"strings"
)

type LuaBuilderScope interface {
	Indent() string
	SetIndent(num int)
	WriteString(str string)
	WriteLine(str string)
	String() string
}

type LuaBuilderTableScope struct {
	indent string
	fields []string
}

func (s *LuaBuilderTableScope) Indent() string {
	return s.indent
}

func (s *LuaBuilderTableScope) SetIndent(num int) {
	s.indent = ""
	for i := 0; i < num; i++ {
		s.indent += "\t"
	}
}

func (s *LuaBuilderTableScope) WriteString(str string) {
	s.fields[len(s.fields)-1] += str
}

func (s *LuaBuilderTableScope) WriteLine(str string) {
	if s.fields == nil {
		s.fields = make([]string, 0, 1)
	}
	s.fields = append(s.fields, s.indent+str)
}

func (s *LuaBuilderTableScope) String() string {
	if len(s.fields) > 0 {
		return strings.Join(s.fields, ",\n") + "\n"
	}
	return ""
}

type LuaBuilderGeneralScope struct {
	indent string
	sb     strings.Builder
}

func (s *LuaBuilderGeneralScope) Indent() string {
	return s.indent
}

func (s *LuaBuilderGeneralScope) SetIndent(num int) {
	s.indent = ""
	for i := 0; i < num; i++ {
		s.indent += "\t"
	}
}

func (s *LuaBuilderGeneralScope) WriteString(str string) {
	s.sb.WriteString(str)
}

func (s *LuaBuilderGeneralScope) WriteLine(str string) {
	s.WriteString(s.indent + str + "\n")
}

func (s *LuaBuilderGeneralScope) String() string {
	return s.sb.String()
}

type LuaBuilder struct {
	indent []int
	scopes []LuaBuilderScope
}

func NewLuaBuilder() *LuaBuilder {
	b := &LuaBuilder{make([]int, 0), make([]LuaBuilderScope, 0)}
	b.pushScope(&LuaBuilderGeneralScope{}, false)
	return b
}

func (b *LuaBuilder) FuncCall(name string, scopeFn func()) *LuaBuilder {
	b.pushScope(&LuaBuilderGeneralScope{}, false)
	b.writeString(name + "(")
	scopeFn()
	str := b.popScope()
	b.writeString(str)
	b.writeLine(")")
	return b
}

func (b *LuaBuilder) Table(scopeFn func()) *LuaBuilder {
	b.writeString("{\n")
	b.pushScope(&LuaBuilderTableScope{}, true)
	scopeFn()
	str := b.popScope()
	if str != "" {
		b.writeString(str)
	}
	b.writeIndentString("}")
	return b
}

func (b *LuaBuilder) Func(scopeFn func()) *LuaBuilder {
	b.writeLine("function()")
	b.pushScope(&LuaBuilderGeneralScope{}, true)
	scopeFn()
	b.writeString(b.popScope())
	b.writeLine("end")
	return b
}

func (b *LuaBuilder) Field(name string, val any) *LuaBuilder {
	if strVal, ok := val.(string); ok {
		if strings.Contains(strVal, "\n") {
			val = fmt.Sprintf("[[\n%s\n]]", strVal)
		} else {
			val = fmt.Sprintf("\"%s\"", luaEscapeString(strVal))
		}
	}
	b.writeLinef("%s = %v", name, val)
	return b
}

func (b *LuaBuilder) FieldScope(name string, scopeFn func()) *LuaBuilder {
	b.pushScope(&LuaBuilderGeneralScope{}, false)
	scopeFn()
	str := b.popScope()
	for strings.HasPrefix(str, "\t") {
		str = strings.TrimPrefix(str, "\t")
	}
	for strings.HasSuffix(str, "\n") {
		str = strings.TrimSuffix(str, "\n")
	}
	b.writeLinef("%s = %v", name, str)
	return b
}

func (b *LuaBuilder) Item(val any) *LuaBuilder {
	if strVal, ok := val.(string); ok {
		if strings.Contains(strVal, "\n") {
			val = fmt.Sprintf("[[\n%s\n]]", strVal)
		} else {
			val = fmt.Sprintf("\"%s\"", luaEscapeString(strVal))
		}
	}
	b.writeLinef("%v", val)
	return b
}

func (b *LuaBuilder) ItemScope(scopeFn func()) *LuaBuilder {
	b.pushScope(&LuaBuilderGeneralScope{}, false)
	scopeFn()
	str := b.popScope()
	for strings.HasPrefix(str, "\t") {
		str = strings.TrimPrefix(str, "\t")
	}
	for strings.HasSuffix(str, "\n") {
		str = strings.TrimSuffix(str, "\n")
	}
	b.writeLine(str)
	return b
}

func (b *LuaBuilder) Linef(format string, a ...any) *LuaBuilder {
	b.writeLine(fmt.Sprintf(format, a...))
	return b
}

func (b *LuaBuilder) Build() string {
	return b.popScope()
}

func (b *LuaBuilder) writeString(str string) {
	b.curScope().WriteString(str)
}

func (b *LuaBuilder) writeIndentString(str string) {
	s := b.curScope()
	s.WriteString(s.Indent() + str)
}

func (b *LuaBuilder) writeStringf(format string, a ...any) {
	b.curScope().WriteString(fmt.Sprintf(format, a...))
}

func (b *LuaBuilder) writeLine(str string) {
	b.curScope().WriteLine(str)
}

func (b *LuaBuilder) writeLinef(format string, a ...any) {
	b.curScope().WriteLine(fmt.Sprintf(format, a...))
}

func (b *LuaBuilder) curScope() LuaBuilderScope {
	return b.scopes[len(b.scopes)-1]
}

func (b *LuaBuilder) pushScope(scope LuaBuilderScope, indent bool) {
	// Push to indent stack
	i := 0
	if indent {
		i = 1
	}
	b.indent = append(b.indent, i)

	// Calculate current indent
	i = 0
	for _, i2 := range b.indent {
		i += i2
	}
	scope.SetIndent(i)

	// Push new scope
	b.scopes = append(b.scopes, scope)
}

func (b *LuaBuilder) popScope() string {
	str := b.curScope().String()
	b.scopes = b.scopes[:len(b.scopes)-1]
	b.indent = b.indent[:len(b.indent)-1]
	return str
}

func luaEscapeString(str string) string {
	str = strings.ReplaceAll(str, "\"", "\\\"")
	return str
}
