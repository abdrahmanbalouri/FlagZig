const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const allocator = init.arena.allocator();
    
    // Get arguments as a slice of strings
    const args = try init.minimal.args.toSlice(allocator);

    for (args) |arg| {
        std.debug.print("{s}\n", .{  arg });
    }
}
