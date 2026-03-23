return {
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"hrsh7th/nvim-cmp",
		opts = {
			sources = {
				{
					name = "path",
					option = {
						trailing_slash = true,
						label_trailing_slash = true,
					},
				},
				{
					name = "buffer",
					option = {
						get_bufnrs = function()
							-- TODO: Get all buffers from harpoon, including the current one.
							return { vim.api.nvim_get_current_buf() }
						end,
					},
				},
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		},
	},
}
