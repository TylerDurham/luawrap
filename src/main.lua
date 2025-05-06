local M = {}

local shell = require("lib.os_shell")
local arguments = require("lib.arguments")

function M.run(v)
	local args = arguments.parse(v)

	for key, value in pairs(args) do
		print(key, value)
	end
end

return M
