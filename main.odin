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
    t0 := time.now()
    if FourdimeInit() {
        rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "HeimDalle")
        defer rl.CloseWindow()

        rl.SetTargetFPS(60)
        for !rl.WindowShouldClose() {
            rl.BeginDrawing()
            defer rl.EndDrawing()
            rl.ClearBackground(rl.BLACK)

            // <- Draw all procs after this point ->
            //DotTriangleSquares() // Square pattern made of pixel level triangles
            //ChaosDotGrid() //Scattered Concentric Dot Pattern
            //FractalPoints() // Combination of the above two
            //CosFractalWave() // Streaking parallax with dif patterns
            //SinFractalWave() // Same as above with better cascade
            //TanFractalWave() // Same as Cos and Sin but better cacscade and moire pattern
            //PixelCheckerBoard() // Checkerboard pixel grid
            //InfiniHatching() //Crazy hatching pattern
            //FourdimeSonicVisual() //This fully creates the fourdime sound effect visually
            //NewWave() //Cascade, need to play more
            //SidisCheckerboard()
            SidisMirrorBoard()

        }
    }
    t1 := time.now()
    dt := time.diff(t0, t1)

    fmt.printf("Time taken: %.2f seconds\n", dt)
    fmt.printf("Time taken: %.3f seconds\n", f64(dt) / f64(time.Millisecond) / 1000.0)
    fmt.printf("Time taken: %.3f ms\n", f64(dt) / f64(time.Millisecond))
}

DotTriangleSquares :: proc() {
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

ChaosDotGrid :: proc() {
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

FractalPoints :: proc() {
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

CosFractalWave :: proc() {
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

TanFractalWave :: proc() {
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

SinFractalWave :: proc() {
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


InfiniHatching :: proc() {
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

PixelCheckerBoard :: proc() {
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

FourdimeSonicVisual :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x, w in 0..=SCREEN_WIDTH {
        for y, z in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            uv := rl.Vector2{
                (center.x / SCREEN_WIDTH) * 20.0 - 10.0,
                (center.y / SCREEN_HEIGHT) * 20.0 - 10.0,
            }

            val := abs(math.tan(uv.y * uv.y)) - math.tan(uv.x / uv.y)
            shade := clamp(val, 0.0, 1.0)
            rl.DrawPixelV(center, rl.ColorFromHSV(hue, 0.75, shade))

        }
    }
}

NewWave :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10) * 36.0

    // <- Calculate color from HSV values ->
    color := rl.ColorFromHSV(hue, 0.75, 0.75)

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=(SCREEN_HEIGHT) {
            center := rl.Vector2{f32(x), f32(y)}
            uv := rl.Vector2{
                (center.x / SCREEN_WIDTH) * 20.0 - 10.0,
                (center.y / SCREEN_HEIGHT) * 20.0 - 10.0,
            }

            val := abs(BigTan(int(center.x / center.y))) - BigTan(0.0)
            shade := clamp(val, 0.0, 1.0)
            rl.DrawPixelV(center, rl.ColorFromHSV(hue, f32(shade), 0.75))
        }
    }
}

SidisCheckerboard :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10.0) * 36.0

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=SCREEN_HEIGHT {
            center := rl.Vector2{f32(x), f32(y)}

            // Normalize pixel position to [0,1], then map to [-10,10]
            uv := rl.Vector2{
                (center.x / f32(SCREEN_WIDTH)) * 20.0 - 10.0,
                (center.y / f32(SCREEN_HEIGHT)) * 20.0 - 10.0,
            }

            // Calculate sine values
            sinx := math.sin_f32(uv.x + f32(rl.GetTime()))
            siny := math.sin_f32(uv.y + f32(rl.GetTime()))
            sinparty := math.sin_f32((sinx * siny) * f32(rl.GetTime()))
            sinpeace := math.sin_f32((sinx / siny) * f32(rl.GetTime()))

            // Calculate tanparty and tanpeace using pow
            tanparty := math.pow_f32(uv.x * uv.y, 6.0)
            tanpeace := math.pow_f32(uv.x / uv.y, 0.33)

            // Fuzzy equality check
            diff := abs(math.tan_f32(tanparty)) == math.tan_f32(tanpeace)

            // Color from HSV based on which side of the condition it's on
            shade_color: rl.Color
            if diff {
                shade_color = rl.ColorFromHSV(hue, siny, sinpeace)
            } else {
                shade_color = rl.ColorFromHSV(hue, sinx, sinparty)
            }

            rl.DrawPixelV(center, shade_color)
        }
    }
}

SidisMirrorBoard :: proc() {
    // <- Calculate hue based on time to change color smoothly ->
    hue := (f32(rl.GetTime()) / 10.0) * 36.0

    // <- Iterate through each pixel on the screen ->
    for x in 0..=SCREEN_WIDTH {
        for y in 0..=SCREEN_HEIGHT {
            center := rl.Vector2{f32(x), f32(y)}

            // Normalize pixel position to [0,1], then map to [-10,10]
            uv := rl.Vector2{
                (center.x / f32(SCREEN_WIDTH)) * 20.0 - 10.0,
                (center.y / f32(SCREEN_HEIGHT)) * 20.0 - 10.0,
            }

            // Calculate sine values
            sinx := math.sin_f32(uv.x + f32(rl.GetTime()))
            siny := math.sin_f32(uv.y + f32(rl.GetTime()))
            sinparty := math.sin_f32((sinx * siny) * f32(rl.GetTime()))
            sinpeace := math.sin_f32((sinx / siny) * f32(rl.GetTime()))

            // Calculate tanparty and tanpeace using pow
            tanparty := math.pow_f32(uv.x * uv.y, 6.0)
            tanpeace := math.pow_f32(uv.x / uv.y, 0.33)

            // Fuzzy equality check
            diff := abs(math.tan_f32(tanparty)) <= math.tan_f32(tanpeace)

            // Color from HSV based on which side of the condition it's on
            shade_color: rl.Color
            if diff {
                shade_color = rl.ColorFromHSV(hue, siny, sinpeace)
            } else {
                shade_color = rl.ColorFromHSV(hue, sinx, sinparty)
            }

            rl.DrawPixelV(center, shade_color)
        }
    }
}