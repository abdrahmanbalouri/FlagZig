const std = @import("std");
const flage = @import("flag.zig");

pub fn main(init: std.process.Init) !void {
    const allocator = init.arena.allocator();

    const args = try init.minimal.args.toSlice(allocator);

    const p = flage.flag("-p", "-port", args);
    const c = flage.flag("-c", "-cort", args);
    const d = flage.flag("-d", "-dort", args);

      if (p.len!=0){

       std.debug.print("{s}\n",.{p});
      }else if (c.len!=0){
       std.debug.print("{s}\n",.{c});

      }else{
       std.debug.print("{s}\n",.{d});

      }
}
