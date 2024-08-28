const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});

    var main_tests = b.addTest(.{
		.root_source_file = b.path("src/time_test.zig"),
		.optimize = optimize,
	});

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
    b.default_step.dependOn(test_step);
}
