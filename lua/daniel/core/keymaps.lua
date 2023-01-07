-- keymaps.lua
-- Author: Daniel Norman Stoddart <stoddart@gmail.com>

-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- For conciseness

---------------------
-- General keymaps
---------------------

-- Use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- Increment
keymap.set("n", "<leader>-", "<C-x>") -- Decrement

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v") -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- Close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  Go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  Go to previous tab

----------------------
-- Plugin keymaps
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- Toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- Find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- Find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- List open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- List available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- List all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- List git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- List git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- List current changes per file with diff preview ["gs" for git status]

-- Restart LSP server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- Mapping to restart LSP if necessary
