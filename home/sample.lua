local syslib = require("std.testlib")

function init()
	write(1, "\nSAMPLE PROGRAM\n")
	flush(1)
	syslib.hello()
end