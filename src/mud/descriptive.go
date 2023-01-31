package mud

import "fmt"

type Named interface {
	GetName() string
	GetNameCapitalized() string
	GetNamePluralized(count int, includeCount bool) string
}

type Descriptive interface {
	Describe() string
}

func GroupDescriptionsFromMap[TKey comparable, TValue any](m map[TKey]TValue, filterFn func(TKey, TValue) bool, descFn func(TKey, TValue) string) []string {
	var descs = make([]string, 0)
	var counts = make(map[string]int)
	for key, val := range m {
		if filterFn != nil && !filterFn(key, val) {
			continue
		}
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

func GroupDescriptionsFromSlice[TValue any](s []TValue, filterFn func(TValue) bool, descFn func(TValue) string) []string {
	var descs = make([]string, 0)
	var counts = make(map[string]int)
	for _, val := range s {
		if filterFn != nil && !filterFn(val) {
			continue
		}
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
