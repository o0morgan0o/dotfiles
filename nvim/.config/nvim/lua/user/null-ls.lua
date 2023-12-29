local M = {
	--"jose-elias-alvarez/null-ls.nvim",
	"nvimtools/none-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({

		-- bloc pour format on save
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
						-- vim.lsp.buf.formatting_sync()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end
		end,
		-- fin block format on save

		sources = {
			formatting.stylua,
			formatting.prettier,
			formatting.prettier.with({
				extra_filetypes = { "toml" },
				-- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			}),
			null_ls.builtins.diagnostics.eslint,
			null_ls.builtins.completion.spell,
			null_ls.builtins.diagnostics.php,
			null_ls.builtins.diagnostics.phpcs,
		},
	})
end

return M
