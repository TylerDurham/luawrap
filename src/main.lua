local M = {}

local shell = require("os_shell")

function M.run(args)
	local result = shell.exec_command("figlet", "-f", "cybermedium", "'Testing 1 2 3'")
	print(result)
end

return M
