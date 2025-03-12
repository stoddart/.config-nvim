return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Custom terminal functions
      local Terminal = require("toggleterm.terminal").Terminal

      -- Lazygit terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      })

      -- Function to toggle lazygit (proper global with uppercase initial)
      function _G.LazyGitToggle()
        lazygit:toggle()
      end

      -- Key mappings
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tg",
        "<cmd>lua LazyGitToggle()<CR>",
        { noremap = true, silent = true, desc = "Toggle Lazygit" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tf",
        "<cmd>ToggleTerm direction=float<cr>",
        { noremap = true, silent = true, desc = "Float Terminal" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>th",
        "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
        { noremap = true, silent = true, desc = "Horizontal Terminal" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>tv",
        "<cmd>ToggleTerm size=80 direction=vertical<cr>",
        { noremap = true, silent = true, desc = "Vertical Terminal" }
      )
    end,
  },
}

