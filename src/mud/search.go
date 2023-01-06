package mud

import (
	"strings"
)

type Matchable interface {
	MatchesKeyword(keyword string) bool
}

type SearchQuery struct {
	Keywords []string
	Joined   string
}

func NewSearchQuery(keywords ...string) SearchQuery {
	return SearchQuery{keywords, strings.Join(keywords, " ")}
}

func (s SearchQuery) IsEmpty() bool {
	return len(s.Keywords) == 0
}

func SearchMap[TKey comparable, TItem Matchable](query SearchQuery, items map[TKey]TItem) (TItem, bool) {
	var none TItem

	if query.IsEmpty() {
		return none, false
	}

	for _, item := range items {
		if item.MatchesKeyword(query.Joined) {
			return item, true
		}
		for _, keyword := range query.Keywords {
			if item.MatchesKeyword(keyword) {
				return item, true
			}
		}
	}
	return none, false
}

func SearchList[TItem Matchable](query SearchQuery, items []TItem) (TItem, bool) {
	if idx, ok := SearchListIndex(query, items); ok {
		return items[idx], true
	}
	var none TItem
	return none, false
}

func SearchListIndex[TItem Matchable](query SearchQuery, items []TItem) (int, bool) {
	if query.IsEmpty() {
		return -1, false
	}

	for idx, item := range items {
		if item.MatchesKeyword(query.Joined) {
			return idx, true
		}
		for _, keyword := range query.Keywords {
			if item.MatchesKeyword(keyword) {
				return idx, true
			}
		}
	}
	return -1, false
}
