const std = @import("std");
const expect = std.testing.expect;

var y: i32 = add(10, x); // calc on runtime
const x: i32 = add(12, 34); // calc on compile time

test "container level variables" {
    try expect(x == 46);
    try expect(y == 56);
}

fn add(a: i32, b: i32) i32 {
    return a + b;
}