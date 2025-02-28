-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Set Python 3 host program for Neovim
vim.g.python3_host_prog = "/Users/daniel/.pyenv/shims/python3"

-- Load LazyVim and plugins
require("config.lazy")

-- Set options
vim.o.startofline = true
