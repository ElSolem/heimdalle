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
        HelloHeimDalle() // -> draws a pixelated HeimDalle; uncomment to see
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
            if math.sin_f32(center.x * center.y) >= math.tan_f32(center.x / center.y) * 0.0001 {
                rl.DrawPixelV(center, color)
            }
        }
    } 
}


