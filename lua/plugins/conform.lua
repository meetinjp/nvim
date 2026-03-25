local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = prettier,
				javascriptreact = prettier,
				typescript = prettier,
				typescriptreact = prettier,
				markdown = prettier,
				yaml = prettier,
				html = prettier,
				json = prettier,
				jsonc = prettier,
				svelte = prettier,
				css = prettier,
				scss = prettier,
				mdx = prettier,
				sql = { "sleek" },
				python = { "ruff" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				toml = { "taplo" },
				cs = { "csharpier" },
				rust = { "rust_analyzer" },

				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			log_level = vim.log.levels.ERROR,
			notify_on_error = true,
		},
	},
}
