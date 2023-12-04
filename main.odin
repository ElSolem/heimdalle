package main

import "core:fmt"
import "core:math"
import rl "vendor:raylib"

// <- window size constants ->
SCREEN_WIDTH :i32= 1280
SCREEN_HEIGHT :i32= 720

main :: proc() {
    rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "HeimDalle")
    defer rl.CloseWindow()
    rl.SetTargetFPS(60)

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        defer rl.EndDrawing()
        rl.ClearBackground(rl.RAYWHITE)

        // <- Call the procs below to draw ->
        // HelloHeimDalle() // -> draws a pixelated HeimDalle Bridge; uncomment to see

        // AboveNBelow() // -> draws a pixelated Sidis Checkerboard; uncomment to see

        wowza() // -> draws a pixelated HeimDalle Bridge with a twist; uncomment to see
    }

    // <- Call the procs below to see the logic gates in action ->
    fmt.println(AndGate(2, 3)) // -> returns false; uncomment to see
    fmt.println(OrGateOne(2, 3)) // -> returns true; uncomment to see
    fmt.println(OrGateTwo(2, 3)) // -> returns true; uncomment to see
    fmt.println(XorGate(2, 3)) // -> returns false; uncomment to see
    fmt.println(NotGate(2, 3)) // -> returns false; uncomment to see

    // <- Call the procs below to see the trigonometric functions in action ->
    fmt.println(BigTan(2)) // -> returns 2.1850399; uncomment to see
    fmt.println(BigCos(2)) // -> returns -0.41614684; uncomment to see
    fmt.println(BigSin(2)) // -> returns 0.9092974; uncomment to see

    // <- Call the procs below to see the power functions in action ->
    fmt.println(DoublePow(2)) // -> returns 4; uncomment to see
    fmt.println(TriplePow(2)) // -> returns 8; uncomment to see
    fmt.println(QuadPow(2)) // -> returns 16; uncomment to see
    fmt.println(PentaPow(2)) // -> returns 32; uncomment to see
    fmt.println(HexaPow(2)) // -> returns 64; uncomment to see
    fmt.println(SeptaPow(2)) // -> returns 128; uncomment to see
    fmt.println(OctaPow(2)) // -> returns 256; uncomment to see
    fmt.println(NonaPow(2)) // -> returns 512; uncomment to see
    fmt.println(TenPow(2)) // -> returns 1024; uncomment to see
}

// <- The procs below are the logic gates ->
// <- They take in two integers and return a boolean ->
AndGate :: proc(x, y: int) -> bool {
    if x * y == x / y {
        return true
    } else {
        return false
    }
}

OrGateOne :: proc(x, y: int) -> bool {
    if x * y >= x / y {
        return true
    } else {
        return false
    }
}

OrGateTwo :: proc(x, y: int) -> bool {
    if x * y <= x / y {
        return true
    } else {
        return false
    }
}

XorGate :: proc(x, y: int) -> bool {
    if x * y != x / y {
        return true
    } else {
        return false
    }
}

NotGate :: proc(x, y: int) -> bool {
    if x * y == x / y {
        return false
    } else {
        return true
    }
}

BigTan :: proc(x: int) -> f32 {
    return math.tan_f32(f32(x))
}

BigCos :: proc(x: int) -> f32 {
    return math.cos_f32(f32(x))
}

BigSin :: proc(x: int) -> f32 {
    return math.sin_f32(f32(x))
}

DoublePow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 2)
}

TriplePow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 3)
}

QuadPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 4)
}

PentaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 5)
}

HexaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 6)
}

SeptaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 7)
}

OctaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 8)
}

NonaPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 9)
}

TenPow :: proc(x: int) -> f32 {
    return math.pow(f32(x), 10)
}

// <- The procs below are the pixelated drawings ->
// <- They use the Raylib library to draw ->
// <- They are commented out to avoid confusion ->


HelloHeimDalle :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 1..=SCREEN_WIDTH {
        for y in 1..=SCREEN_HEIGHT {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if DoublePow(int(math.sin_f32(center.x - 10))) * DoublePow(int(math.tan_f32(center.y - 10))) >= DoublePow(int(math.tan_f32(center.x / center.y))) * .01 {
                rl.DrawPixelV(center, color)
            }
        }
    } 
}

AboveNBelow :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 360.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 1..=SCREEN_WIDTH {
        for y in 1..=SCREEN_HEIGHT {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if math.pow(math.tan_f32(center.x * center.y), 6) <= math.pow(math.tan_f32(center.x / center.y), (2/3)) {
                rl.DrawPixelV(center, color)
            }
        }
    } 
}

wowza :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if math.sin_f32((center.x * center.y) * 3.6) >= math.sin_f32(center.y / 360) * .01{
                rl.DrawPixelV(center, color)
            }
        }
    }
}