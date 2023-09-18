const print = @import("std").debug.print;

pub fn main() void {
  var x: i32 = undefined;
  print("{d}\n", .{x});
  x = 1;
  print("{d}\n", .{x});
}