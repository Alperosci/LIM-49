local activefile = "home/sample.lua"

function init()
    write(1, "C: mounted")
    awrite(1, "\nLIM-OS\nType 'help' for commands.\n\n")
    flush(1)
end

function update()
    write(1, "C:/home> ")
    flush(1)
    read(2)
    if ram[2] ~= "" then
        if ram[2] == "cls" then
            cls()
        elseif ram[2] == "exit" then
            bye()
        elseif string.sub(ram[2], 1, 4) == "load" then
            if not exists(activefile) then
                write(1, "File not found: " .. activefile .. "\n")
                flush(1)
                return
            end
            activefile = "home/" .. string.sub(ram[2], 6)
            write(1, "Loaded file: " .. activefile .. "\n")
            flush(1)
        elseif ram[2] == "run" then
            runfile(activefile)
        elseif ram[2] == "path" then
            write(1, "PATH : " .. path(activefile) .. "\n")
            flush(1)
        elseif ram[2] == "edit" then
            nanoedit(activefile)
        elseif ram[2] == "help" then
            write(1, "\n==COMMANDS==\n")
            awrite(1, "cls  - Clear the screen\n")
            awrite(1, "exit - Exit the shell\n")
            awrite(1, "help - Show this help message\n")
            awrite(1, "load [name] - Loads a code file\n")
            awrite(1, "run - Runs code that loaded\n")
            awrite(1, "path - Shows path of loaded code\n")
            awrite(1, "ls - Lists files\n")
            awrite(1, "edit - Opens loaded code in nano editor\n")
            awrite(1, "load [name] - Loads a codefile\n")
            awrite(1, "==SPECS==\n")
            awrite(1, "RAM adresses: 64, 1 - 64\n")
            awrite(1, "LIM-49 version: 0.1\n")
            awrite(1, "LIM-OS version: 1.1\n\n")
            flush(1)
        elseif ram[2] == "ls" then
            listfiles()
        else
            write(1, "Unknown: " .. ram[2] .. "\n")
            flush(1)
        end
    end
end