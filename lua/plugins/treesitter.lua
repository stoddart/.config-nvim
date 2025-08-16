return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query", -- core ones
        "c",
        "python",
        "ruby", -- your languages
      },
      highlight = { enable = true },
    },
  },
}
