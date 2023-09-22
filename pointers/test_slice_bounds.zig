const expect = @import("std").testing.expect;

test "pointer slicing" {
    var array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    var start: usize = 2; // array[start] == 3
    try expect(array[start] == 3);
    // 若干違和感あるが、2番目から4番目の前（3番目）まで
    const slice = array[start..4]; // 3, 4
    try expect(slice[0] == 3);
    try expect(slice[1] == 4);
    // try expect(slice[2] == 5); // out of bounds
    try expect(slice.len == 2);

    try expect(array[3] == 4);
    slice[1] += 1;
    try expect(array[3] == 5);
}