-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.cmd("let g:netrw_liststyle = 3")

-- Key mappings using LazyVim's approach
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and opts.noremap == nil then
    opts.noremap = false
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Set up new mappings with which-key integration
map("n", "gcc", "<cmd>Commentary<CR>", { desc = "Comment line" })
map("n", "yy", "<Plug>(YankyYank)", { desc = "Yank line with Yanky" })
map("n", "oo", "o<Esc>", { desc = "Insert line below" })
map("n", "Y", "<Plug>(YankyYank)", { desc = "Yank line with Yanky" })
map("n", "F", "", { desc = "Around word" })
map("n", "w", "", { desc = "Inside word" })
