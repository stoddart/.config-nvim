-- Import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- Configure treesitter

require("nvim-treesitter.install").compilers = { "clang" }

treesitter.setup({
	ignore_install = { "c", "help", "lua", "vim" },

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
		"awk",
		"bash",
		"css",
		"dockerfile",
		"gitignore",
		"go",
		"graphql",
		"html",
		"http",
		"javascript",
		"json",
		"markdown",
		"perl",
		"php",
		"python",
		"racket",
		"ruby",
		"svelte",
		"tsx",
		"typescript",
		"yaml",
	},
	-- Auto install above language parsers
	auto_install = true,
})
