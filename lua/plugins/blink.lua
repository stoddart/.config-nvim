return {
  "Saghen/blink.cmp",
  dir = vim.fn.expand("~/.local/share/nvim/lazy/blink.cmp"), -- Use the manually cloned version
  config = function()
    -- Just load the plugin without trying to configure fuzzy matching yet
    require("blink.cmp").setup({
      fuzzy = { implementation = "lua" },
    })
  end,
}
