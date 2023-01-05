-- Import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- For conciseness
local formatting = null_ls.builtins.formatting -- To setup formatters
local diagnostics = null_ls.builtins.diagnostics -- To setup linters

-- To setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Configure null_ls
null_ls.setup({
	-- Setup formatters & linters
	sources = {
		--  To disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		formatting.prettier, -- JS/TS formatter
		formatting.stylua, -- Lua formatter
		diagnostics.eslint_d.with({ -- JS/TS linter
			-- Only enable eslint if root has .eslintrc.js
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- Change file extension if you use something else
			end,
		}),
	},
	-- Configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  Only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
