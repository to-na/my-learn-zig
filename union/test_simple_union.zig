const std = @import("std");
const expect = std.testing.expect;

const Payload = union {
    intVal: i64,
    floatVal: f64,
    boolVal: bool,
};
test "simple union" {
    var payload = Payload{ .intVal = 1234 };
    try expect(payload.intVal == 1234);
    payload = Payload{ .floatVal = 12.34 };
    try expect(payload.floatVal == 12.34);
}