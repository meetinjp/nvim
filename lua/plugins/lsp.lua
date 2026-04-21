return {
	{ "b0o/schemastore.nvim" },
	{ "ray-x/lsp_signature.nvim", config = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"b0o/schemastore.nvim",
		},
		config = function()
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
				callback = function(ev)
					local opts = { buffer = ev.buf, remap = false }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>lw", vim.lsp.buf.workspace_symbol, opts)
					vim.keymap.set("n", "<leader>lf", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, opts)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, opts)
					vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>lef", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>h", vim.lsp.buf.signature_help, opts)
				end,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
							},
						},
					},
				},
			})

			vim.lsp.config("clangd", {
				capabilities = vim.tbl_deep_extend("force", capabilities, {
					offsetEncoding = "utf-16",
				}),
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

			vim.lsp.config("jsonls", {
				capabilities = capabilities,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
					"heex",
				},
			})

			for _, server in ipairs({ "rust_analyzer", "gopls", "vtsls" }) do
				vim.lsp.config(server, { capabilities = capabilities })
			end

			-- Only enable servers whose executable is actually on PATH. Mason puts
			-- its installs on PATH during setup, so by the time lspconfig loads
			-- we can check with vim.fn.executable. This avoids error spam when a
			-- server isn't installed yet (e.g., first launch before Mason finishes).
			local server_exe = {
				lua_ls = "lua-language-server",
				clangd = "clangd",
				jsonls = "vscode-json-language-server",
				tailwindcss = "tailwindcss-language-server",
				rust_analyzer = "rust-analyzer",
				gopls = "gopls",
				vtsls = "vtsls",
			}
			local to_enable = {}
			for server, exe in pairs(server_exe) do
				if vim.fn.executable(exe) == 1 then
					table.insert(to_enable, server)
				end
			end
			vim.lsp.enable(to_enable)

			vim.diagnostic.config({
				virtual_text = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "if_many",
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
