# LIM-49 Fantasy Computer

A simple fantasy computer system with only 64 memory addresses, implemented in LUA. LIM-49 provides basic memory operations and a simple shell interface.
###### Only supports **linux** for now

## Features

- 64 addressable RAM locations
- Simple command-line interface (LIM-OS)
- Dynamic program loading and execution
- Built-in text editor support (nano)

## Installation

To run the system:

1. Ensure you have LUA interpreter installed
2. Clone the project
3. Run the following command:

```sh
./run.sh
```

The [`run.sh`](run.sh) script will automatically check dependencies and install nano editor if needed.

## Commands

Available commands in LIM-OS:

- `cls` - Clear screen
- `exit` - Exit shell
- `help` - Show help message
- `load [file]` - Load a code file
- `run` - Run loaded code
- `path` - Show path of loaded code
- `ls` - Lists files
- `edit` - Open loaded code in nano editor

## Programming

Programs for LIM-49 are written in LUA. Programs can contain two main functions:

```lua
function init()
    -- Initialization code
end

function update()
    -- Continuous running code
end
```

### Memory Operations

- `write(address, value)` - Write to RAM
- `awrite(address, value)` - Append to RAM
- `flush(address)` - Print RAM contents to screen
- `read(address)` - Read user input to RAM

## Example Program

See [`sample.lua`](sample.lua) for a basic example:

```lua
function init()
    write(1, "\nSAMPLE PROGRAM\n\n")
    flush(1)
end
```

## System Requirements

- LUA interpreter
- nano text editor (automatically installed by run.sh)
- Linux/Unix-based system (Debian, Arch, or Fedora-based distributions supported)

## Version Information

- LIM-49 version: 0.1
- LIM-OS version: 1.1