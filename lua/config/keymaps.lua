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

-- Set up new mappings
map("n", "gcc", "<cmd>Commentary<CR>", { desc = "Comment line" })
map("n", "yy", "<Plug>(YankyYank)", { desc = "Yank line with Yanky" })
map("n", "oo", "o<Esc>", { desc = "Insert line below" })
map("n", "Y", "<Plug>(YankyYank)", { desc = "Yank line with Yanky" })

-- Register which-key mappings
local wk = require("which-key")
wk.register({
  ["gcc"] = { name = "Comment line", mode = { "n" } },
  ["yy"] = { name = "Yank line with Yanky", mode = { "n" } },
  ["oo"] = { name = "Insert line below", mode = { "n" } },
  ["Y"] = { name = "Yank line with Yanky", mode = { "n" } },
  ["F"] = { name = "Around word", mode = { "n" } },
  ["w"] = { name = "Inside word", mode = { "n" } },
})
