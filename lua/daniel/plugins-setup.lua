-- Auto install Packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads Neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Import Packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Add list of plugins to install
return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- Lua functions that many plugins use

	use("bluz71/vim-nightfly-guicolors") -- Preferred colorscheme

	use("christoomey/vim-tmux-navigator") -- Tmux & split window navigation

	use("szw/vim-maximizer") -- Maximizes and restores current window

	-- Essential plugins
	use("tpope/vim-surround") -- Add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- Replace with register contents using motion (gr + motion)

	-- Commenting with gc
	use("numToStr/Comment.nvim")

	-- File explorer
	use("nvim-tree/nvim-tree.lua")

	-- VSCode-like icons
	use("nvim-tree/nvim-web-devicons")

	-- Statusline
	use("nvim-lualine/lualine.nvim")

	-- Fuzzy finding w/ Telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- Fuzzy finder

	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- Completion plugin
	use("hrsh7th/cmp-buffer") -- Source for text in buffer
	use("hrsh7th/cmp-path") -- Source for file system paths

	-- Snippets
	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("saadparwaiz1/cmp_luasnip") -- For autocompletion
	use("rafamadriz/friendly-snippets") -- Useful snippets

	-- Managing & installing LSP servers, linters & formatters
	use("williamboman/mason.nvim") -- In charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- Bridges gap b/w mason & lspconfig

	-- Configuring LSP servers
	use("neovim/nvim-lspconfig") -- Easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- For autocompletion
	use("glepnir/lspsaga.nvim") -- Enhanced LSP UIs
	use("jose-elias-alvarez/typescript.nvim") -- Additional functionality for Typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- VSCode-like icons for autocompletion

	-- Formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- Configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- Bridges gap b/w mason & null-ls

	-- Treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Auto closing
	use("windwp/nvim-autopairs") -- Autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- Autoclose tags

	-- Git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	if packer_bootstrap then
		require("packer").sync()
	end
end)
