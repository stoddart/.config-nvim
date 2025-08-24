-- ~/.config/nvim/lua/plugins/shellcheck.lua
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" }, -- For POSIX shell scripts
        bash = { "shellcheck" }, -- For bash scripts
        zsh = { "shellcheck" }, -- Optional: zsh scripts
      },
    },
    config = function(_, opts)
      local lint = require("lint")

      -- Apply user options
      lint.linters_by_ft = opts.linters_by_ft

      -- Auto run linting on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })

      -- Manual linting keymap: <leader>cl
      vim.keymap.set("n", "<leader>cl", function()
        lint.try_lint()
      end, { desc = "Run ShellCheck (lint)" })
    end,
  },
}
