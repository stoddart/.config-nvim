-- Bootstrap lazy.nvim, LazyVim, and plugins
require("config.lazy")

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

wk.register({
  -- Register your new key mappings with descriptions
  ["gcc"] = "Comment out line",
  ["yy"] = "Yank line with Yanky",
  ["oo"] = "Insert new line below",
  ["Y"] = "Yank line with Yanky (new keybinding)",
})
