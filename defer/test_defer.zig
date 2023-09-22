const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;


fn deferExample() !usize {
    var a: usize = 1;

    {
        // defer はスコープを出る際に実行される
        defer a = 2;
        a = 1;
    }
    try expect(a == 2);

    a = 5;
    return a;
}

test "defer basics" {
    try expect((try deferExample()) == 5);
}

// 複数の defer はスコープを出る際に逆順で実行される
fn deferUnwindExample() !void {
    var a: usize = 1;

    {
        defer a = 2;
        defer a = 3;
        a = 1;
    }
   try expect(a == 2);
}

test "defer unwinding" {
    try deferUnwindExample();
}