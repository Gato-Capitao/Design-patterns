package main

import "fmt"

//Server
type server interface{
	handleRequest(string, string) (int, string)
}

//Application
type Application struct{}

func (a *Application) handleRequest(url, method string) (int, string) {
    if url == "/app/status" && method == "GET" {
        return 200, "Ok"
    }

    if url == "/create/user" && method == "POST" {
        return 201, "User Created"
    }
    return 404, "Not Ok"
}

//Proxy
type Nginx struct {
	application *Application
	maxRequest int
	rateLimiter map[string]int
}

func newServer() *Nginx{
	return &Nginx{
		application: &Application{},
		maxRequest: 2,
		rateLimiter: make(map[string]int),
	}
}

func (proxy *Nginx) checkRateLimit(url string) bool{
	if proxy.rateLimiter[url] == 0{
		proxy.rateLimiter[url] = 1
	}
	if proxy.rateLimiter[url] > proxy.maxRequest{
		return false
	}

	proxy.rateLimiter[url] = proxy.rateLimiter[url] + 1
	return true
}

func (proxy *Nginx) handleRequest(url, method string) (int, string) {
    allowed := proxy.checkRateLimit(url)
    if !allowed {
        return 403, "Not Allowed"
    }
    return proxy.application.handleRequest(url, method)
}

//Main
func main() {
    nginxServer := newServer()
    appStatusURL := "/app/status"
    createuserURL := "/create/user"

    httpCode, body := nginxServer.handleRequest(appStatusURL, "GET")
    fmt.Printf("\nUrl: %s\nHttpCode: %d\nBody: %s\n", appStatusURL, httpCode, body)

    httpCode, body = nginxServer.handleRequest(appStatusURL, "GET")
    fmt.Printf("\nUrl: %s\nHttpCode: %d\nBody: %s\n", appStatusURL, httpCode, body)

    httpCode, body = nginxServer.handleRequest(appStatusURL, "GET")
    fmt.Printf("\nUrl: %s\nHttpCode: %d\nBody: %s\n", appStatusURL, httpCode, body)

    httpCode, body = nginxServer.handleRequest(createuserURL, "POST")
    fmt.Printf("\nUrl: %s\nHttpCode: %d\nBody: %s\n", appStatusURL, httpCode, body)

    httpCode, body = nginxServer.handleRequest(createuserURL, "GET")
    fmt.Printf("\nUrl: %s\nHttpCode: %d\nBody: %s\n", appStatusURL, httpCode, body)
}