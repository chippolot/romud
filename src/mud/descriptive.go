package mud

import "fmt"

type Named interface {
	Name() string
	NameCapitalized() string
}

type Descriptive interface {
	Describe() string
}

func GroupDescriptionsFromMap[TKey comparable, TValue any](m map[TKey]TValue, descFn func(TKey, TValue) string) []string {
	var descs = make([]string, 0)
	var counts = make(map[string]int)
	for key, val := range m {
		desc := descFn(key, val)
		if desc == "" {
			continue
		}
		if cnt, ok := counts[desc]; ok {
			counts[desc] = cnt + 1
		} else {
			counts[desc] = 1
			descs = append(descs, desc)
		}
	}
	if len(descs) == 0 {
		return descs
	}
	for idx, desc := range descs {
		cnt := counts[desc]
		if cnt > 1 {
			descs[idx] = fmt.Sprintf("[%d] %s", cnt, desc)
		}
	}
	return descs
}

func GroupDescriptionsFromSlice[TValue any](s []TValue, descFn func(TValue) string) []string {
	var descs = make([]string, 0)
	var counts = make(map[string]int)
	for _, val := range s {
		desc := descFn(val)
		if desc == "" {
			continue
		}
		if cnt, ok := counts[desc]; ok {
			counts[desc] = cnt + 1
		} else {
			counts[desc] = 1
			descs = append(descs, desc)
		}
	}
	if len(descs) == 0 {
		return descs
	}
	for idx, desc := range descs {
		cnt := counts[desc]
		if cnt > 1 {
			descs[idx] = fmt.Sprintf("[%d] %s", cnt, desc)
		}
	}
	return descs
}
