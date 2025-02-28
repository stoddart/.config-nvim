-- Bootstrap lazy.nvim, LazyVim, and plugins
require("config.lazy")

-- Set options
vim.o.startofline = true

-- Set Python 3 host program for Neovim
vim.g.python3_host_prog = "/Users/daniel/.pyenv/shims/python3"

-- Define a helper function to safely delete key mappings
local function safe_del_keymap(mode, lhs)
  local exists = vim.fn.mapcheck(lhs, mode) ~= ""
  if exists then
    vim.api.nvim_del_keymap(mode, lhs)
  end
end

-- Safely unmap the conflicting keybindings
safe_del_keymap("n", "gc")
safe_del_keymap("n", "y")
safe_del_keymap("n", "o")

-- Define key mappings to avoid conflicts
vim.api.nvim_set_keymap("n", "gcc", "<cmd>Commentary<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "yy", "<Plug>(YankyYank)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "oo", "o<Esc>", { noremap = true, silent = true })

-- Rebind 'Y' to the YankyYank command (choose a new keybinding for 'y')
vim.api.nvim_set_keymap("n", "Y", "<Plug>(YankyYank)", { noremap = true, silent = true })

-- Use WhichKey's API to check existing keymaps and handle conflicts
local wk = require("which-key")

-- Add key mappings with descriptions
wk.add({
  -- Keep existing commonly used key mappings
  { "y", desc = "Yank (copy)" }, -- Keep 'y' for yank (optional)
  { ">", desc = "Indent right" }, -- Keep '>' for indent right
  { "<", desc = "Indent left" }, -- Keep '<' for indent left

  -- Custom mappings with conflict resolution
  { "gcc", desc = "Comment out line" },
  { "yy", desc = "Yank line with Yanky" },
  { "oo", desc = "Insert new line below" },
  { "Y", desc = "Yank line with Yanky (new keybinding)" },

  -- Choose different keys for custom 'a' and 'i' mappings
  { "F", desc = "Around word (custom)" }, -- Replace 'i' with 'F' (example)
  { "w", desc = "Inside word (custom)" }, -- Replace 'a' with 'w' (example)
})
