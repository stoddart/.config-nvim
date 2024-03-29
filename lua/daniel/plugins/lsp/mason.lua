-- Import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- Import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- Import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- Enable mason
mason.setup()

mason_lspconfig.setup({
	-- List of servers for mason to install
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
	},
	-- Auto-install configured servers (with lspconfig)
	automatic_installation = true, -- Not the same as ensure_installed
})

mason_null_ls.setup({
	-- List of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
	},
	-- Auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
