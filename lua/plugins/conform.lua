local prettier = { "prettierd", "prettier", stop_after_first = true }

-- Prettier doesn't support stdin filepaths, which breaks markdown-specific
-- config (proseWrap: always for *.md files). Splitting the command ensures
-- prettier sees the filetype and applies the correct prose wrapping rules.
local prettier_md = { "prettier" }

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				prettierd = {
					env = {
						PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/prettier/.prettierrc.json"),
					},
				},
				prettier = {
					args = {
						"--config",
						vim.fn.expand("~/.config/prettier/.prettierrc.json"),
						"--stdin-filepath",
						"$FILENAME",
					},
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = prettier,
				javascriptreact = prettier,
				typescript = prettier,
				typescriptreact = prettier,
				markdown = prettier_md,
				mdx = prettier_md,
				yaml = prettier,
				html = prettier,
				json = prettier,
				jsonc = prettier,
				svelte = prettier,
				css = prettier,
				scss = prettier,
				sql = { "sleek" },
				python = { "ruff" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				toml = { "taplo" },
				cs = { "csharpier" },
				rust = { "rust_analyzer" },
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
