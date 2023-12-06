package main

import "core:fmt"
import ex "examples"

A : [500][500]f32 = 4.
B : [500][500]f32 = 4.

QGates :: proc() {
    if A * B == A / B || A * B != A / B {
        fmt.println("A * B == A / B || A * B != A / B")
        ex.Exemplar()
        fmt.println(ex.QGate(2, 3))
    }
}

main :: proc() {
    QGates()
}