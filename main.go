package main

import (
	"fmt"
	"helloworld-go/gowebservice"
	"net/http"
)

func main() {
	fmt.Println("web server is running on :8080")
	HelloWorldWebServer()
}

func HelloWorldHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, gowebservice.HelloWorld())
}

func HelloWorldWebServer() {
	http.HandleFunc("/", HelloWorldHandler)
	http.ListenAndServe(":8080", nil)
}
