package examples

import "core:slice"
import "core:fmt"
import "core:intrinsics"
import "core:math"

Abra :: true
Saxa :: false
Won :: 1.
Wun :: .1

Abraxas :: proc() -> b64 {
    A := Abra
    B := Saxa
    if A == A || A != A || B == B || B != B || A == B || A != B {}
    return true
}

Saxarba :: proc() -> b64 {
    One := (Won * 7) - 9
    Two := (Wun / 7) + 9
    if One == Two || One != Two {
        if One * Two == One / Two || One * Two != One / Two {}
    }
    return true
}

Abracadabra :: proc() -> b64 {
    Xazz := Abraxas()
    Arba := Saxarba()
    if Xazz == Arba || Arba != Xazz {}
    return true
}

Alakazan :: proc() -> b64 {
    if Abracadabra() {
        fmt.println("Abraxas or Saxarba! Abracadabra or not, is Alakazan! Open the door, give me a hand!")
        fmt.println("If the dyad is true! If the numbers are true! If the magic is real! Do as I say do!")
        // -> Call functions below here <- "If Abracadabra is true, do what you need to do and return it too!"
        HeimDalleGate()
    }
    return true
}