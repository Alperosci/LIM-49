local machine = require("sys.machine")
local testlib = {}

local ram

function testlib.init(mem)
    ram = mem
end

function testlib.hello()
    machine.write(ram, 1, "Hello from testlib!\n\n")
    machine.flush(ram, 1)
end

return testlib