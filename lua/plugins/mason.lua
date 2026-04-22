return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
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
				"vtsls",
				"prettierd",
				"eslint-lsp",
				"codelldb",
				"json-lsp",
				"css-lsp",
				"shfmt",
				"bash-language-server",
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
