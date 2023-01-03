package utils

import (
	"fmt"
	"log"

	"github.com/chippolot/go-mud/src/bits"
)

const LogFlag_None = bits.Bits(0)
const LogFlag_All = ^(bits.Bits(0))

var DefaultLogger = &Logger{LogFlag_All, make(map[bits.Bits]string)}

type Logger struct {
	flags     bits.Bits
	flagNames map[bits.Bits]string
}

func (l *Logger) SetMask(mask bits.Bits) {
	l.flags = mask
}

func (l *Logger) RegisterFlag(flag bits.Bits, name string) bits.Bits {
	l.flagNames[flag] = name
	return flag
}

func (l *Logger) Logln(flag bits.Bits, str string) {
	if flag == LogFlag_None || bits.Has(l.flags, flag) {
		str = l.prependFlagName(str, flag)
		log.Println(str)
	}
}

func (l *Logger) LogF(flag bits.Bits, format string, a ...any) {
	if flag == LogFlag_None || bits.Has(l.flags, flag) {
		format = l.prependFlagName(format, flag)
		log.Printf(format, a...)
	}
}

func (l *Logger) prependFlagName(str string, flag bits.Bits) string {
	if name, ok := l.flagNames[flag]; ok {
		return fmt.Sprintf("[%s] %s", name, str)
	}
	return str
}
