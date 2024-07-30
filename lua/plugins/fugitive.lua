return {
	{
		"tpope/vim-fugitive",
		lazy = false,
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>" },
			{ "<leader>gv", "<cmd>Gvdiffsplit!<CR>" },
			{ "gh", "<cmd>diffget //2<CR>" },
			{ "gu", "<cmd>diffget //3<CR>" },
		},
	},
}
