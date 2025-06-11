package main

import "core:math"
import "core:math/rand"
import "core:time"
import "core:fmt"
import "core:mem"
import ex "examples"

quantum_transformer :: proc() -> bool {
    for y in 0..<100000 {
        for x in 0..<100000 {
            if y != 0 {
                if ((x*y) == (x/y)) || ((x*y) != (x/y)) {
                switch {
                    case x*y == x/y:
                        fmt.println("Polyrefractal")
                        fmt.println(ex.Vivaos())
                        fallthrough
                    case x*y != x/y:
                        fmt.println("Parallax")
                        fmt.println(ex.Abraxas())
                        fallthrough
                    case:
                        ex.Miraisadora()
                        fmt.println("Other")
                        return true
                    }
                }
            }
        }
    }
    return true
}

/*
main :: proc() {
    quantum_transformer()
}*/