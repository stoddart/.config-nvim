return {
  "folke/which-key.nvim",
  lazy = false, -- Load immediately
  config = function()
    -- Manually append to runtime path
    vim.opt.rtp:append(vim.fn.stdpath("data") .. "/lazy/which-key.nvim")

    require("which-key").setup({})
  end,
}
