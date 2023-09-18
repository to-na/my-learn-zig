const std = @import("std");

// !void はエラーユニオン型
pub fn main() !void {
  const stdout = std.io.getStdOut().writer();
  // try していることに注目
  try stdout.print("Hello, {s}!\n", .{ "world" });
}