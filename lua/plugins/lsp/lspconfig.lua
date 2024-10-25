return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.lsp.inlay_hint.enable()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local bufnr = ev.buf

				vim.keymap.set("n", "<leader>lh", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
				end, { buffer = bufnr, desc = "Toggle inlay hints" })

				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ buffer = bufnr, desc = "See available code actions" }
				)

				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Smart rename" }) -- smart rename

				vim.keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					{ buffer = bufnr, desc = "Show line diagnostic" }
				) -- show diagnostics for line

				vim.keymap.set(
					"n",
					"[d",
					vim.diagnostic.goto_prev,
					{ buffer = bufnr, desc = "go to previous diagnostic" }
				) -- jump to previous diagnostic in buffer

				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "go to next diagnostic" }) -- jump to next diagnostic in buffer

				vim.keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					{ buffer = bufnr, desc = "show document for what is under cursor" }
				) -- show documentation for what is under cursor

				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { buffer = bufnr, desc = "Restart LSP" }) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			ts_ls = function() end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
