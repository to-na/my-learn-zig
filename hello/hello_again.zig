const print = @import("std").debug.print;

// hello.zig と違いエラーユニオン型でない
pub fn main() void {
  print("Hello, world!\n", .{});
}