const std = @import("std");

pub fn flag(short: []const u8, big: []const u8, args: []const [:0]const u8) []const u8 {
    var next = false;

    for (args) |arg| {
        if (next) {
            return arg;
        }

        if (std.mem.eql(u8, arg, short) or std.mem.eql(u8, arg, big)) {
            next = true;
        }
    }
    return "";
}