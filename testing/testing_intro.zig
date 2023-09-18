const std = @import("std");

test "expect addOne adds one to 41" {
  // `try` is used to return an error to the test runner to notify it that the test failed.
  try std.testing.expect(addOne(41) == 42);
}

test addOne {
  // A test name can also be written using an identifier.
  try std.testing.expect(addOne(41) == 42);
}

/// The function `addOne` adds one to the number given as its argument.
fn addOne(number: i32) i32 {
    return number + 1;
}