package mud

import (
	"log"
	"strconv"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

type Matchable interface {
	MatchesKeyword(keyword string) bool
}

type SearchQuery struct {
	Keywords []string
	Joined   string
	Number   int
}

func NewSearchQuery(keywords ...string) SearchQuery {
	q := SearchQuery{keywords, strings.Join(keywords, " "), 0}
	for idx, k := range keywords {
		idxDot := strings.IndexByte(k, '.')
		if idxDot == -1 {
			continue
		}
		nstr := k[idxDot+1:]
		if n, err := strconv.Atoi(nstr); err == nil {
			q.Number = utils.MaxInts(0, n-1)
			keywords[idx] = keywords[idx][:idxDot]
			break
		}
	}
	return q
}

func (s SearchQuery) IsEmpty() bool {
	return len(s.Keywords) == 0
}

func SearchMap[TKey comparable, TItem Matchable](query SearchQuery, items map[TKey]TItem) []TItem {
	res := make([]TItem, 0)

	if query.IsEmpty() {
		return res
	}

	for _, item := range items {
		if doesSearchQueryMatch(query, item) {
			res = append(res, item)
		}
	}
	return filterSearchResults(query, res)
}

func SearchList[TItem Matchable](query SearchQuery, items []TItem) []TItem {

	res := make([]TItem, 0)

	if query.IsEmpty() {
		return res
	}

	for _, item := range items {
		if doesSearchQueryMatch(query, item) {
			res = append(res, item)
		}
	}
	return filterSearchResults(query, res)
}

func doesSearchQueryMatch[TItem Matchable](query SearchQuery, item TItem) bool {
	if query.Joined == "all" {
		return true
	}
	if item.MatchesKeyword(query.Joined) {
		return true
	}
	for _, keyword := range query.Keywords {
		if item.MatchesKeyword(keyword) {
			return true
		}
	}
	return false
}

func filterSearchResults[TItem Matchable](query SearchQuery, results []TItem) []TItem {
	if len(results) == 0 {
		return results
	}
	log.Println("FOUND?", len(results), query.Number)
	if query.Number >= len(results) {
		return results[:0]
	}
	return results[query.Number : query.Number+1]
}
