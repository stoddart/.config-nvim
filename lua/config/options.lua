-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Remove or comment out this line to enable formatting
-- vim.g.lazyvim_format_on_save = false

-- Optionally, customize formatting settings
vim.g.lazyvim_format_on_save = {
  timeout_ms = 500,
  lsp_fallback = true,
}
