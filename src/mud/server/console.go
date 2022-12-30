package server

import (
	"log"
	"regexp"
	"strings"
)

var ANSIColorCodeLookup = map[string]string{
	"reset":      "\x1b[0m",
	"bright":     "\x1b[1m",
	"dim":        "\x1b[2m",
	"underscore": "\x1b[4m",
	"blink":      "\x1b[5m",
	"reverse":    "\x1b[7m",
	"hidden":     "\x1b[8m",

	"black":   "\x1b[30m",
	"red":     "\x1b[31m",
	"green":   "\x1b[32m",
	"yellow":  "\x1b[33m",
	"blue":    "\x1b[34m",
	"magenta": "\x1b[35m",
	"cyan":    "\x1b[36m",
	"white":   "\x1b[37m",

	"bg_black":   "\x1b[40m",
	"bg_red":     "\x1b[41m",
	"bg_green":   "\x1b[42m",
	"bg_yellow":  "\x1b[43m",
	"bg_blue":    "\x1b[44m",
	"bg_magenta": "\x1b[45m",
	"bg_cyan":    "\x1b[46m",
	"bg_white":   "\x1b[47m",
}

var ANSIColorCodePattern = regexp.MustCompile(`<c.*?>.*?</c>`)

func processANSIColorCodes(s string) string {
	return ANSIColorCodePattern.ReplaceAllStringFunc(s, func(m string) string {
		i := strings.Index(m, ">")
		var sb strings.Builder
		for _, tok := range strings.Fields(m[2:i]) {
			if code, ok := ANSIColorCodeLookup[tok]; ok {
				sb.WriteString(code)
			} else {
				log.Printf("unknown ANSI color code: %s", code)
			}
		}
		sb.WriteString(m[i+1 : len(m)-4])
		sb.WriteString(ANSIColorCodeLookup["reset"])
		return sb.String()
	})
}
