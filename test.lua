local text = arg or arg(0)
print(text)
local stat = io.stdin:read(0)
if stat then
	input = io.read("*a") -- read all from stdin
end
print(input)
