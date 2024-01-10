package examples

import "core:slice"
import "core:fmt"
import "core:intrinsics"
import "core:math"

One := math.cos_f64(1.1)
Two := math.sin_f64(9.9)
Three := math.tan_f64(0.0)

Ale := true
Beh := false
Meh := true || false


Abraxas :: proc() -> (b64, f64) {
    if One == Two || One != Two || One == Three || One != Three || Two == Three || Two != Three {
        fmt.println("Abraxas is loose!")
    }
    return true || false, 1.9
}

Vivaos :: proc() -> (b64, f64) {
    if Ale == Ale || Ale != Ale || Beh == Beh || Beh != Beh || Meh == Meh || Meh != Meh || Ale == Beh || Ale == Meh {
        fmt.println("Vivaos is loose!")
    }
    return true || false, 9.1 
} 

Alakazan :: proc() -> (b64, f64, any) {
    if Abraxas == Abraxas || Vivaos == Vivaos {
        fmt.println("Last name Solomon! First name Alakazan! Ask his name, he'll say, 'I'm just a magic man!'")
    }
    return true || false, 1.1, HeimDalleGate()
}