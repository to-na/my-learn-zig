const print = @import("std").debug.print;

// 行頭から始まらないのは良い
const hello_world_in_c =
  \\#include <stdio.h>
  \\
  \\int main(int argc, char **argv) {
  \\    printf("hello world\n");
  \\    return 0;
  \\}
;

pub fn main() void {
  print("{s}\n", .{hello_world_in_c});
}