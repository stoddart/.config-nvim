-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = true, -- all plugins are lazy-loaded by default
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Bootstrap lazy.nvim, LazyVim, and plugins
require("config.lazy")

-- Set options
vim.o.startofline = true

-- Set Python 3 host program for Neovim
vim.g.python3_host_prog = "/Users/daniel/.pyenv/shims/python3"

-- Key mappings using LazyVim's approach
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and opts.noremap == nil then
    opts.noremap = false
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Remove conflicting keymaps
vim.keymap.del("n", "gc")
vim.keymap.del("n", "y")
vim.keymap.del("n", "o")

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
