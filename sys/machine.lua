local machine = {}

function machine.write(ram, address, value)
    if address < 1 or address > #ram then
        error("Address out of bounds")
    end
    ram[address] = value
end

function machine.awrite(ram, address, value)
    if address < 1 or address > #ram then
        error("Address out of bounds")
    end
    ram[address] = ram[address] .. value
end

function machine.flush(ram, address)
    if address < 1 or address > #ram then
        error("Address out of bounds")
        return
    elseif ram[address] == "" then
        error("Memory adress empty - " .. address)
    end
    io.write(ram[address])
    ram[address] = ""
end

function machine.read(ram, adress)
    if adress < 1 or adress > #ram then
        error("Address out of bounds")
        return
    end
    ram[adress] = io.read()
end

function machine.cls()
    os.execute("clear")
end

return machine