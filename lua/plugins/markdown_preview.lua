return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function(plugin)
			vim.opt.rtp:prepend(plugin.dir)
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			if vim.env.WSL_DISTRO_NAME then
				vim.g.mkdp_browser = "C:\\Program Files\\Firefox Developer Edition\\firefox.exe"
			end
		end,
		ft = { "markdown" },
		keys = {
			{ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>" },
		},
	},
}
