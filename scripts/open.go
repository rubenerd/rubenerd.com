package main

import ( 
    "fmt"
    "io"
    "os"
)

func main() {
    file, error := os.OpenFile("helloworld");

    if error != nil {
        fmt.Println(error)
        return
    }

    defer file.Close()
}
