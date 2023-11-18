const std = @import("std");

// const raylib = @import("raylib");
// const c = @cImport({
//     @cInclude("raygui.h"); // Required for GUI controls
// });

const raylib = @cImport({
    @cInclude("raylib.h");
    @cInclude("raymath.h");
    @cInclude("rlgl.h");
    @cInclude("raygui.h");
    // @cInclude("style_dark.h");
});

pub fn main() void {
    raylib.SetConfigFlags(raylib.FLAG_WINDOW_RESIZABLE);
    raylib.InitWindow(800, 800, "hello world!");
    raylib.SetTargetFPS(60);

    defer raylib.CloseWindow();

    while (!raylib.WindowShouldClose()) {
        raylib.BeginDrawing();
        defer raylib.EndDrawing();

        raylib.ClearBackground(raylib.BLACK);
        raylib.DrawFPS(10, 10);
        var start_angle: f32 = 0;
        _ = raylib.GuiSliderBar(.{ .x = 600, .y = 40, .width = 120, .height = 20 }, "StartAngle", null, &start_angle, -450, 450);

        raylib.DrawText("hello world!", 100, 100, 20, raylib.YELLOW);
    }
}
