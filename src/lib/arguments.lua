local argparse = require("argparse")

local figlet_fonts = {
	"3-d",
	"3x5",
	"5lineoblique",
	"acrobatic",
	"alligator",
	"alligator2",
	"alphabet",
	"avatar",
	"banner",
	"banner3-D",
	"banner3",
	"banner4",
	"barbwire",
	"basic",
	"bell",
	"big",
	"bigchief",
	"binary",
	"block",
	"bubble",
	"bulbhead",
	"caligraphy",
	"caligraphy2",
	"catwalk",
	"chunky",
	"coinstak",
	"colossal",
	"computer",
	"contessa",
	"contrast",
	"cosmic",
	"cosmike",
	"courier",
	"crawford",
	"cricket",
	"cursive",
	"cyberlarge",
	"cybermedium",
	"cybersmall",
	"decimal",
	"digital",
	"doh",
	"doom",
	"dotmatrix",
	"drpepper",
	"eftichess",
	"eftifont",
	"eftipiti",
	"eftirobot",
	"eftitalic",
	"eftiwall",
	"eftiwater",
	"epic",
	"fender",
	"fourtops",
	"fuzzy",
	"goofy",
	"gothic",
	"graffiti",
	"hollywood",
	"invita",
	"isometric1",
	"isometric2",
	"isometric3",
	"isometric4",
	"italic",
	"ivrit",
	"jazmine",
	"jerusalem",
	"katakana",
	"kban",
	"larry3d",
	"lcd",
	"lean",
	"letters",
	"linux",
	"lockergnome",
	"madrid",
	"marquee",
	"maxfour",
	"merlin1",
	"merlin2",
	"mike",
	"mini",
	"mirror",
	"mnemonic",
	"modular",
	"morse",
	"moscow",
	"nancyj",
	"nancyj-fancy",
	"nancyj-underlined",
	"nancyj-improved",
	"nipples",
	"ntgreek",
	"o8",
	"ogre",
	"pawp",
	"peaks",
	"pebbles",
	"pepper",
	"poison",
	"puffy",
	"pyramid",
	"rectangles",
	"relief",
	"relief2",
	"rev",
	"roman",
	"rot13",
	"rounded",
	"rowancap",
	"rozzo",
	"runic",
	"runyc",
	"sblood",
	"script",
	"serifcap",
	"shadow",
	"short",
	"slant",
	"slide",
	"slscript",
	"small",
	"smisome1",
	"smkeyboard",
	"smpoison",
	"smscript",
	"smshadow",
	"smslant",
	"smtengwar",
	"speed",
	"stampatello",
	"standard",
	"starwars",
	"stellar",
	"stforek",
	"stop",
	"straight",
	"sub-zero",
	"swamp_land",
	"swan",
	"sweet",
	"tanja",
	"tengwar",
	"term",
	"thick",
	"thin",
	"threepoint",
	"ticks",
	"ticksslant",
	"tinker-toy",
	"tombstone",
	"trek",
	"tsalagi",
	"twopoint",
	"univers",
	"usaflag",
	"wavy",
	"weird",
	"whimsy",
}

local supported_languages = {
	lua = "--",
	python = "#",
	ruby = "#",
	bash = "#",
	cobol = "*",
	fortran = "!",
	assembly = ";",
	masm = ";",
	asm = ";",
	zsh = "#",
	javascript = "//",
	typescript = "//",
	java = "//",
	c = "//",
	cpp = "//",
	js = "//",
	ts = "//",
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

local get_keys = function(t)
	local rt = {}
	for key, value in pairs(t) do
		table.insert(rt, key) --rt.add(key)
	end

	return rt
end

local M = {}

M.parse = function()
	local parser = argparse("cwrap", "An example.")

	parser:argument("input", "The input.")

	parser
		:option("-f --figlet-font", "Output using a [f]iglet by specifying a figlet font.")
		:choices(figlet_fonts)
		:count("0-1")

	parser
		:option("-l --language", "The programming [l]language you need the input text commented.")
		:choices(get_keys(supported_languages))
		:count("0-1")

	parser:flag("-n --no-hr"):default(false)

	local args = parser:parse()

	local comment_chars = supported_languages[args.language]
	if comment_chars == nil then
		comment_chars = "--"
	end

	return {
		text = args.input,
		language = args.language,
		comment_chars = comment_chars,
		figlet_font = args.figlet_font,
		no_hr = args.no_hr,
	}
end

return M
