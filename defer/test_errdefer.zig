const std = @import("std");
const print = std.debug.print;

// The errdefer keyword is similar to defer, but will only execute if the
// scope returns with an error.
//
// This is especially useful in allowing a function to clean up properly
// on error, and replaces goto error handling tactics as seen in c.
fn deferErrorExample(is_error: bool) !void {
    print("\nstart\n", .{});

    // This will always be executed on exit
    defer {
        print("end of function\n", .{});
    }

    errdefer {
        // useful for cleanup
        print("encountered an error!\n", .{});
    }

    if (is_error) {
        return error.DeferError;
    }
}

// The errdefer keyword also supports an alternative syntax to capture the
// generated error.
//
// This is useful for printing an additional error message during clean up.
fn deferErrorCaptureExample() !void {
    errdefer |err| {
        std.debug.print("the error is {s}\n", .{@errorName(err)});
    }

    return error.DeferError;
}

test "errdefer unwinding" {
    deferErrorExample(false) catch {};
    deferErrorExample(true) catch {};
    deferErrorCaptureExample() catch {};
}