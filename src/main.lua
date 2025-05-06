local M = {}

local arguments = require("lib.arguments")
local printer = require("lib.printer")

function M.run(v)
	local args = arguments.parse(v)
	local text = args.text
	local comment_chars = args.comment_chars
	local language = args.language
	local figlet_font = args.figlet_font
	local no_hr = args.no_hr

	printer.print(comment_chars, text, figlet_font, no_hr)
end

return M
