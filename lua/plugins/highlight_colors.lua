return {
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			vim.opt.termguicolors = true

			require("nvim-highlight-colors").setup({
				render = "background",
				enable_named_colors = true,
				enable_tailwind = true,
			})
		end,
		keys = {
			-- NOTE: It's disabled by default, because it's lazy-loaded.
			{
				"<leader>hc",
				"<cmd>HighlightColor toggle<CR>",
			},
		},
	},
}
