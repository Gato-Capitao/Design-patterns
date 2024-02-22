package main

import "fmt"

func fatorial(num int) int {
    if num == 1 || num == 0 {
        return 1
    }

    return num*fatorial(num-1)
}

func main() {
    fmt.Println(fatorial(9))
}