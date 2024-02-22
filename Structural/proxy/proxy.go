package main

type Nginx struct {
	application *Application
	maxRequest int
	rateLimiter map[string]int
}

func newServer() *Nginx{
	return &Nginx{
		application: &Application{},
		maxRequest: 2,
		rateLimiter: make(map[string]int)
	}
}

func (proxy *Nginx) checkRateLimit(url string) bool{
	if proxy.rateLimiter[url] == 0{
		proxy.rateLimiter = 1
	}
	if proxy.rateLimiter[url] > proxy.maxRequest{
		return false
	}

	proxy.rateLimiter[url] = proxy.rateLimiter[url] + 1
	return true
}