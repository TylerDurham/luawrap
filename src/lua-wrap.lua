local argparse = require("argparse")

local supported_languages = {
	lua = "--",
	python = "#",
	ruby = "#",
	bash = "#",
	javascript = "//",
	java = "//",
	c = "//",
	cpp = "//",
	go = "//",
	rust = "//",
	perl = "#",
	php = "//",
	sql = "--",
	haskell = "--",
	elixir = "#",
	toml = "#",
	yaml = "#",
	ini = ";",
}

local get_languages = function()
	for key, value in pairs(supported_languages) do
		print(key)
	end
end

local parser = argparse("script", "An example.")

parser:argument("input", "The input.")
parser:option("-f --figlet-font", "Use a [f]iglet by specifying a figlet font.")
parser:option("-l --language", "The programming [l]language you need the input text commented.")

local args = parser:parse()

local comment_chars = supported_languages[args.language]
if comment_chars == nil then
	comment_chars = "--"
end

print("Language selected: " .. args.language .. " which has comments that are: " .. comment_chars)
-- get_languages()

-- for k, v in pairs(args) do
-- 	print(k, v)
-- end
--
-- local lines = io.lines()
-- if lines ~= nil then
-- 	print("Got lines!")
-- 	for line in lines do
-- 		print(line)
-- 	end
-- end

-- ---[[
-- * Get arg values
--  * Get the langage to use as the comment characters
--    * determine the language
--  * Get the figlet
--
-- * Is the text to wrap passed via argument or via STDIN?
--  * STDIN Loop over each line and wrap with prefix.
-- --- ]]
