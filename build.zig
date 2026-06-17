const std = @import("std");

pub fn build(b: *std.Build) void {
    // 1. Get your target and optimization options first
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // 2. Initialize the executable using the modern 'root_module' structure
    const exe = b.addExecutable(.{
        .name = "hello",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    // 3. The rest of your plumbing stays the same
    b.installArtifact(exe);

    const run_exe = b.addRunArtifact(exe);
   run_exe.addPassthruArgs();


    const run_step = b.step("run", "Run the application");
    run_step.dependOn(&run_exe.step);
}