package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {

	authHeader := r.Header.Get("Authorization")
	if authHeader == "Bearer 12345678" {
		w.Header().Add("UserId", "Demo User")
		w.WriteHeader(200)

		fmt.Println("Responding with 200")
	} else if authHeader == "" {
		w.WriteHeader(401)
		fmt.Println("Responding with 401")
	} else {
		w.WriteHeader(403)
		fmt.Println("Responding with 403")
	}
	fmt.Println()
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server running...")
	http.ListenAndServe(":8080", nil)
}
