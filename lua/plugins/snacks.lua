return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.image = vim.tbl_deep_extend("force", opts.image or {}, {
        enabled = true,
        render = {
          latex = true,
        },
        formats = {
          norg = false, -- disable Neorg format so no parser check
        },
      })
    end,
  },
}
