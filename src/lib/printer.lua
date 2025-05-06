local shell = require("lib.os_shell")

local hr = function(comment_char, line_char, width)
	print(comment_char .. " " .. string.rep(line_char, width))
end

local do_print = function(comment_chars, text)
	print(string.format("%s %s", comment_chars, text))
end

local do_print_line = function(comment_chars, text, hr_callback)
	hr_callback()
	for line in text:gmatch("[^\r\n]+") do
		do_print(comment_chars, line, hr)
	end
	hr_callback()
end

local M = {}

M.print = function(comment_chars, text, figlet_font, no_hr)
	-- Did the caller specify a figlet font?
	if figlet_font ~= nil then
		-- Yes, run the text through figlet.
		text = shell.exec_command("figlet", "-f", figlet_font, text)
	end

	local hr = function()
		if no_hr == false then
			-- Grab the first line of text
			local first_line = text:match("[^\r\n]+")

			-- Calculate the width for the horizontal line
			local width = #first_line
			hr(comment_chars, "#", width)
		end
	end

	do_print_line(comment_chars, text, hr)
end

return M
