return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      lua = { "stylua" },
      -- Add other filetypes as needed
    },
    -- Explicitly omit format_on_save to use LazyVim's defaults or disable it
  },
}
