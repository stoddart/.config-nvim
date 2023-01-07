-- colorscheme.lua
-- Author: Daniel Norman Stoddart <stoddart@gmail.com>

local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Colorscheme not found!")
	return
end
