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
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              linters = {
                SentenceCapitalization = false,
                SpellCheck = false,
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
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
      -- Removed format_on_save to avoid conflict with LazyVim's defaults
    },
  },
}
