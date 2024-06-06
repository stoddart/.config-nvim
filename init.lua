-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Remove the 'require('plugins')' line since it doesn't exist
-- Define key mappings, replacing the conflicting ones

-- Example key mappings that might conflict
-- Use vim.api.nvim_set_keymap to set new key mappings or change conflicting ones
vim.api.nvim_set_keymap("n", "<new_gc_key>", "<your_command>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<new_y_key>", "<Plug>(YankyYank)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<new_o_key>", "<your_command>", { noremap = true, silent = true })

-- Use WhichKey's API to check existing keymaps
local wk = require("which-key")

wk.register({
  -- Here you can list your key mappings or just handle conflicts
  -- For example:
  -- ["<new_gc_key>"] = "Description for the new gc keybinding",
  -- ["<new_y_key>"] = "Description for the new y keybinding",
  -- ["<new_o_key>"] = "Description for the new o keybinding",
})

-- Unmap conflicting keybindings
vim.api.nvim_del_keymap("n", "gc")
vim.api.nvim_del_keymap("n", "y")
vim.api.nvim_del_keymap("n", "o")
