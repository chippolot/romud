package mud

import (
	"math"
	"strconv"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

type Matchable interface {
	MatchesKeyword(keyword string) bool
}

type SearchQuery struct {
	Keyword string
	Index   int
	Count   int
}

func NewSearchQuery(keyword string, count int) SearchQuery {
	q := SearchQuery{keyword, -1, count}
	if keyword == "all" {
		q.Count = math.MaxInt
	} else if dotIdx := strings.Index(keyword, "."); dotIdx != -1 {
		preDot := keyword[:dotIdx]
		postDot := keyword[dotIdx+1:]
		if num, err := strconv.Atoi(preDot); err == nil {
			q.Index = utils.MaxInts(0, num-1)
		} else if preDot == "all" {
			q.Count = math.MaxInt
		}
		q.Keyword = postDot
	}
	return q
}

func (s SearchQuery) IsEmpty() bool {
	return s.Keyword == ""
}

func SearchMap[TKey comparable, TItem Matchable](query SearchQuery, items map[TKey]TItem, filter func(TItem) bool) []TItem {
	res := make([]TItem, 0)

	if query.IsEmpty() {
		return res
	}

	for _, item := range items {
		if doesSearchQueryMatch(query, item) && (filter == nil || filter(item)) {
			res = append(res, item)
		}
	}
	return filterSearchResults(query, res)
}

func SearchList[TItem Matchable](query SearchQuery, items []TItem, filter func(TItem) bool) []TItem {

	res := make([]TItem, 0)

	if query.IsEmpty() {
		return res
	}

	for _, item := range items {
		if doesSearchQueryMatch(query, item) && (filter == nil || filter(item)) {
			res = append(res, item)
		}
	}
	return filterSearchResults(query, res)
}

func doesSearchQueryMatch[TItem Matchable](query SearchQuery, item TItem) bool {
	if query.Keyword == "all" {
		return true
	}
	if item.MatchesKeyword(query.Keyword) {
		return true
	}
	return false
}

func filterSearchResults[TItem Matchable](query SearchQuery, results []TItem) []TItem {
	if len(results) == 0 {
		return results
	}
	if query.Index == -1 {
		return results[:utils.MinInts(len(results), query.Count)]
	}
	if query.Index >= len(results) {
		return results[:0]
	}
	return results[query.Index : query.Index+1]
}
