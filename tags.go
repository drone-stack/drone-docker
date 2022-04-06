package docker

import (
	"fmt"
	"strings"
	"time"
)

// TagSuffix gen tag
func TagSuffix(suffix string) (string, error) {
	t := time.Now().Format("20060102")
	if len(suffix) == 0 {
		return t, nil
	}
	if strings.HasSuffix(suffix, "-") {
		return fmt.Sprintf("%s%s", suffix, t), nil
	}
	return fmt.Sprintf("%s-%s", suffix, t), nil
}
