package main

import (
	"fmt"
	"net/http"
	"os"
)

func GetMessage() string {
	value := os.Getenv("MESSAGE")
	if len(value) == 0 {
		return "World"
	}
	return value
}

func handler(w http.ResponseWriter, r *http.Request) {
	message := GetMessage()
	fmt.Fprintf(w, "{\"message\": \"Hello, %s!\"}", message)

	w.Header().Set("Content-Type", "application/json")
}

func main() {
	version := "0.2"
	fmt.Printf("hello-world: %s\n", version)
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
