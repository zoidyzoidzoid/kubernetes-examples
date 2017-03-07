package main

import (
	"fmt"
	"os"
)

func GetMessage() string {
	value := os.Getenv("MESSAGE")
	if len(value) == 0 {
		return "World"
	}
	return value
}

func main() {
	fmt.Println("hello-world: 0.2")
	message := GetMessage()
	fmt.Printf("Hello, %s!\n", message)
}
