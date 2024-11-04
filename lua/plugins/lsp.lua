return {
	{ "b0o/schemastore.nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x", -- TODO: v3.x
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			local lsp = require("lsp-zero")
			local lspconfig = require("lspconfig")
			local cmp = require("cmp")

			lsp.preset({})
			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			-- (Optional) Configure lua language server for neovim
			lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

			-- Fix Undefined global 'vim'
			lsp.nvim_workspace()

			-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local cmp_mappings = lsp.defaults.cmp_mappings({
				["<Enter>"] = cmp.mapping.confirm({ select = true }),
				["<C-c>"] = cmp.mapping.complete(),
			})

			lsp.setup_nvim_cmp({
				mapping = cmp_mappings,
			})
			lsp.set_preferences({
				suggest_lsp_servers = false,
				sign_icons = {
					error = "E",
					warn = "W",
					hint = "H",
					info = "I",
				},
			})
			lsp.on_attach(function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>lw", vim.lsp.buf.workspace_symbol, opts)
				vim.keymap.set("n", "<leader>lf", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>lef", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>h", vim.lsp.buf.signature_help, opts)
			end)
			lsp.setup({})
			lspconfig.jsonls.setup({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			lspconfig.clangd.setup({
				capabilities = {
					offsetEncoding = "utf-16",
				},
				cmd = { "clangd" },
				filetypes = { "c", "cpp" },
				init_options = {
					fallbackFlags = {
						["c"] = {
							"-std=c11",
							"-Wall",
							"-Wextra",
							"-Werror",
						},
						["cpp"] = {
							"-ggdb",
							"-pedantic-errors",
							"-Wall",
							"-Weffc++",
							"-Wextra",
							"-Wconversion",
							"-Wsign-conversion",
							"-Werror",
							"-Wshadow",
							"-std=c++23",
						},
					},
				},
			})
			vim.diagnostic.config({
				virtual_text = true,
			})
		end,
	},
	{ "ray-x/lsp_signature.nvim", config = true },
}
