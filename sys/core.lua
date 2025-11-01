local machine = require("sys.machine")

local ram = {}

for i = 1, 64 do
    table.insert(ram, "")
end

print("RAM initialized with 64 adresses")

local function run_game(filename)
    local env = {
        ram = ram,
        string = string,
        write = function (addr, val)
            machine.write(ram, addr, val)
        end,
        awrite = function (addr, val)
            machine.awrite(ram, addr, val)
        end,
        flush = function (addr)
            machine.flush(ram, addr)
        end,
        read = function (addr)
            machine.read(ram, addr)
        end,
        cls = function ()
            machine.cls()
        end,
        bye = os.exit,
        runfile = run_game,
        exists = function (file)
            local f = io.open(file, "r")
            if f then
                f:close()
                return true
            else
                return false
            end
        end,
        path = function (file)
            local p = io.popen("realpath " .. file)
            local f = p:read("*l")
            p:close()
            return f
        end,
        nanoedit = function (file)
            os.execute("nano " .. file)
        end,
        listfiles = function ()
            local p = io.popen("ls ./home")
            for file in p:lines() do
                print(file)
            end
            p:close()
        end
    }

    local fn = loadfile(filename, "t", env)
    if fn then
        fn()
    else
        error("Could not load file: " .. filename)
    end

    if env.init then
        env.init()
    end

    if env.update then 
        while true do
            env.update()
        end
    end
end

print("Starting shell...")
run_game("sys/shell.lua")
