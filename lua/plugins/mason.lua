return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = true,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"stylua",
				"clangd",
				"clang-format",
				"rust-analyzer",
				"typescript-language-server",
				"prettierd",
				"eslint-lsp",
				"python-lsp-server",
				"ruff",
				"codelldb",
				"json-lsp",
				"css-lsp",
				"shfmt",
				"bash-language-server",
				"taplo",
				"codespell",
				"csharp-language-server",
				"csharpier",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = { "codelldb" },
			handlers = {},
		},
	},
}
