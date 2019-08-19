package golang

import (
"fmt"
"net/http"
)

func main() {

	fmt.Println("Hello!!")

	http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Welcome to my website!")
	})


	http.HandleFunc("/person", func (w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "He is a nice person!")
	})


	fs := http.FileServer(http.Dir("static/"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))

	http.ListenAndServe(":4000", nil)
}

