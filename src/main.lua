local M = {}

local shell = require("lib.os_shell")
local arguments = require("lib.arguments")

local hr = function(comment_char, line_char, width)
	print(comment_char .. " " .. string.rep(line_char, width))
end

function M.run(v)
	local args = arguments.parse(v)

	if args.figlet_font ~= nil then
		local result = shell.exec_command("figlet", "-f", args.figlet_font, args.text)
		local first_line = result:match("[^\r\n]+")
		local width = #first_line

		if args.no_hr == false then
			hr(args.comment_chars, "#", width)
		end

		for line in result:gmatch("[^\r\n]+") do
			print(string.format("%s %s", args.comment_chars, line))
		end
		if args.no_hr == false then
			hr(args.comment_chars, "#", width)
		end
	else
		print(args.comment_chars .. " " .. args.text)
	end

	-- for key, value in pairs(args) do
	-- 	print(key, value)
	-- end
end

return M
