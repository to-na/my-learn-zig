const std = @import("std");
const expect = std.testing.expect;

const imported_file = @import("testing_intro.zig");

test {
  // ref. https://ziglang.org/documentation/master/#Nested-Container-Tests
  // 次の行はcontainer のテストを参照する（imported_file も含む）はずだが、なくても実行された
  // std.testing.refAllDecls(@This());
  
  _ = S;
  _ = U;
  _ = @import("testing_intro.zig");
}

const S = struct {
  test "S demo test" {
    try expect(true);
  }

  const SE = enum {
    V,
    // NOT Top Level
    test "This Test Won't Run" {
      try expect(false);
    }
  };
};

const U = union {
  s: US, // US が参照されているので U.US も test される
  const US = struct {
    test "U.US demo test" {
      try expect(true);
    }
  };

  test "U demo test" {
    try expect(true);
  }
};
