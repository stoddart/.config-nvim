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

-- Set up which-key groups
require("which-key").setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  operators = { gc = "Comments" },
  key_labels = {},
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 2, 1, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
})
