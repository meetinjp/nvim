return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		keys = {
			{
				"<leader>a",
				"<cmd>lua require('harpoon'):list():add()<cr>",
			},
			{
				"<C-e>",
				"<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
			},

			{
				"<C-h>",
				"<cmd>lua require('harpoon'):list():select(1)<cr>",
			},
			{
				"<C-t>",
				"<cmd>lua require('harpoon'):list():select(2)<cr>",
			},
			{
				"<C-n>",
				"<cmd>lua require('harpoon'):list():select(3)<cr>",
			},
			{
				"<C-s>",
				"<cmd>lua require('harpoon'):list():select(4)<cr>",
			},
			{
				"<leader><C-h>",
				"<cmd>lua require('harpoon'):list():replace_at(1)<cr>",
			},
			{
				"<leader><C-t>",
				"<cmd>lua require('harpoon'):list():replace_at(2)<cr>",
			},
			{
				"<leader><C-n>",
				"<cmd>lua require('harpoon'):list():replace_at(3)<cr>",
			},
			{
				"<leader><C-s>",
				"<cmd>lua require('harpoon'):list():replace_at(4)<cr>",
			},
		},
	},
}
