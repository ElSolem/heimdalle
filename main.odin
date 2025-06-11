package main

import "core:slice"
import "core:fmt"
import "base:intrinsics"
import "core:math"
import "core:time"
import rl "vendor:raylib"
import rand "core:math/rand"
import noise "core:math/noise"
import ex "/examples"

// <- window size constants ->
SCREEN_WIDTH :: 1280
SCREEN_HEIGHT :: 720

main :: proc() {
    if fourdime_init() {
        rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "HeimDalle")
        defer rl.CloseWindow()

        rl.SetTargetFPS(60)
        for !rl.WindowShouldClose() {
            rl.BeginDrawing()
            defer rl.EndDrawing()
            rl.ClearBackground(rl.BLACK)

            // <- Draw all procs after this point ->
            // HelloHeimDalle() // Square pattern made of pixel level triangles
            // AboveNBelow() //Scattered Concentric Dot Pattern
            // Wowza() // Combination of the above two
            //CosWave() // Streaking parallax with dif patterns
            //SinWave() // Same as above with better cascade
            //TanWave() // Same as Cos and Sin but better cacscade and moire pattern
            //NewWaveTwo() // Checkerboard pixel grid
            //NewWave3D() //Crazy hatching pattern
        }
    }
}

HelloHeimDalle :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 360.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 1..=SCREEN_WIDTH {
        for y in 1..=SCREEN_HEIGHT {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if (math.cos_f32(center.x)) * (math.sin_f32(center.y)) >= (math.tan_f32(9.9)) {
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
            if math.pow(math.tan_f32(center.x * center.y), 6) <= math.pow(math.tan_f32(center.x / center.y), (2/3)) * .000001||
            math.pow(math.tan_f32(center.x * center.y), 6) == math.pow(math.tan_f32(center.x / center.y), (2/3)) * .000001  {
                rl.DrawPixelV(center, color)
            }
        }
    } 
}

Wowza :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 360.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if math.sin_f32((center.x * center.y) * 3.6) >= math.sin_f32(center.y / 360) * 1 { // <- Multiply by 1.x to change parallax effect :: eg. 1.1, 1.2, 1.3, 1.etc-> 
                rl.DrawPixelV(center, color)
            }
        }
    }
}

CosWave :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if BigCos(int(center.x * center.y)) <= BigCos(int(center.x / center.y)) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}

TanWave :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if BigTan(int(center.x * center.y)) <= BigTan(int(center.x / center.y)) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}

SinWave :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if BigSin(int(center.x * center.y)) <= BigSin(int(center.x / center.y)) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}


NewWave3D :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if f64(math.cos_f32(center.x * center.x * center.x) + math.sin_f32(center.y * center.y * center.y)) <= BigTan(0.0) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}

NewWaveTwo :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            // <- Check the condition and draw the pixel ->
            if f64(math.cos_f32(center.x) * math.sin_f32(center.y)) >= BigTan(0.0) {
                rl.DrawPixelV(center, color)
            }
        }
    }
}
