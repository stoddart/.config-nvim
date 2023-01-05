-- Import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- Configure treesitter
treesitter.setup({
	-- Enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- Enable indentation
	indent = { enable = true },
	-- Enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- Ensure these language parsers are installed
	ensure_installed = {
		"bash",
		"c",
		"css",
		"dockerfile",
		"gitignore",
		"go",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"perl",
		"php",
		"python",
		"ruby",
		"svelte",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	-- Auto install above language parsers
	auto_install = true,
})
