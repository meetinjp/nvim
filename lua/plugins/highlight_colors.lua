return {
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			vim.opt.termguicolors = true

			require("nvim-highlight-colors").setup({
				render = "background",
				enable_named_colors = true,
				enable_tailwind = true,
				custom_colors = {
					-- label property will be used as a pattern initially(string.gmatch), therefore you need to escape the special characters by yourself with %
					{ label = "eac", color = "" },
					{ label = "def", color = "" },
				},
			})
		end,
		keys = {
			{
				"<leader>hc",
				function()
					vim.cmd("HighlightColor toggle")
				end,
			},
		},
	},
}
