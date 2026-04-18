return {
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"hrsh7th/nvim-cmp",
		opts = {
			mapping = {
				["<Tab>"] = {
					i = function(fallback)
						local cmp = require("cmp")
						local luasnip = require("luasnip")
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end,
					s = function(fallback)
						local luasnip = require("luasnip")
						if luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end,
				},
				["<S-Tab>"] = {
					i = function(fallback)
						local cmp = require("cmp")
						local luasnip = require("luasnip")
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end,
					s = function(fallback)
						local luasnip = require("luasnip")
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end,
				},
				["<CR>"] = {
					i = function(fallback)
						local cmp = require("cmp")
						if cmp.visible() and cmp.get_selected_entry() then
							cmp.confirm({ select = false })
						else
							fallback()
						end
					end,
				},
				["<C-Space>"] = {
					i = function()
						require("cmp").complete()
					end,
				},
				["<C-e>"] = {
					i = function()
						require("cmp").abort()
					end,
				},
			},
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
