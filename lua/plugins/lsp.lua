return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          cmd = { "ruff", "server", "--preview" }, -- Use ruff's native language server with preview features
          filetypes = { "python" }, -- Explicitly set filetypes for clarity
          settings = {
            args = { "--line-length=88", "--ignore=E203,W503" }, -- Align with black and pyproject.toml
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" }, -- Use black for Python formatting
      },
      format_on_save = {
        timeout_ms = 500, -- Timeout for formatting to prevent lag
        lsp_fallback = true, -- Fallback to LSP if formatter fails
      },
    },
  },
}
