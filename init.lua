-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Define a helper function to safely delete key mappings
local function safe_del_keymap(mode, lhs)
  local exists = vim.fn.mapcheck(lhs, mode) ~= ""
  if exists then
    vim.api.nvim_del_keymap(mode, lhs)
  end
end

-- Define key mappings to avoid conflicts
vim.api.nvim_set_keymap("n", "<new_gc_key>", "<your_command>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<new_y_key>", "<Plug>(YankyYank)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<new_o_key>", "<your_command>", { noremap = true, silent = true })

-- Use WhichKey's API to check existing keymaps and handle conflicts
local wk = require("which-key")

wk.register({
  -- Here you can list your key mappings or just handle conflicts
  ["<new_gc_key>"] = "Description for the new gc keybinding",
  ["<new_y_key>"] = "Description for the new y keybinding",
  ["<new_o_key>"] = "Description for the new o keybinding",
})

-- Safely unmap conflicting keybindings
safe_del_keymap("n", "gc")
safe_del_keymap("n", "y")
safe_del_keymap("n", "o")
