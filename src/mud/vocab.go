package mud

import "log"

type NounConfig struct {
	Singular string
	Plural   string
}

type Vocab struct {
	nouns map[string]*NounConfig
}

func NewVocab() *Vocab {
	return &Vocab{make(map[string]*NounConfig)}
}

func (v *Vocab) GetNoun(key string) *NounConfig {
	n, ok := v.nouns[key]
	if !ok {
		log.Printf("invalid noun key: %s", key)
	}
	return n
}
