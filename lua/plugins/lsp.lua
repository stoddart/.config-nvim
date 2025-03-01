return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      perlls = {
        cmd = {
          "perl",
          "-MPerl::LanguageServer",
          "-e",
          "Perl::LanguageServer::run",
          "--",
          "--port",
          "13603",
          "--log-level",
          "2",
        },
        filetypes = { "perl" },
        root_dir = require("lspconfig").util.root_pattern(".git", "."),
      },
    },
  },
}
