local M = {}
--- Executes a shell command.
---@param string The command name.
---@vararg string A list of command arguments.
---@return string The output of the command as a string.
M.exec_command = function(command_name, ...)
	local params = table.concat({ ... }, " ")
	local command = command_name .. " " .. params

	print(command)

	local f = assert(io.popen(command, "r"))
	local stream = assert(f:read("*a"))
	f:close()

	return stream
end
return M
