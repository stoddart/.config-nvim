return {
  "folke/which-key.nvim",
  lazy = false, -- Ensures it loads immediately
  config = function()
    -- Manually append runtime path
    vim.opt.rtp:append(vim.fn.stdpath("data") .. "/lazy/which-key.nvim")

    require("which-key").setup({})
  end,
}
