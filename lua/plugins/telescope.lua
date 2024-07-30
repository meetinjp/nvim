return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		opts = {
			defaults = {
				layout_config = {
					horizontal = {
						preview_cutoff = 0,
						width = 0.95,
						preview_width = 0.5,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				path_display = {
					truncate = 0,
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				find_files = {
					hidden = true,
				},
				live_grep = {
					-- @usage don't include the filename in the search results
					only_sort_text = true,
				},
				grep_string = {
					only_sort_text = true,
				},
				git_files = {
					hidden = true,
					show_untracked = true,
				},
			},
		},
		keys = {
			{
				"<C-f>",
				"<cmd>lua require('telescope.builtin').find_files()<cr>",
			},
			{
				"<C-p>",
				"<cmd>lua require('telescope.builtin').git_files()<cr>",
			},
			{
				"<C-g>",
				"<cmd>lua require('telescope.builtin').live_grep()<cr>",
			},
			{
				"<leader>sg",
				"<cmd>lua require('telescope.builtin').grep_string()<cr>",
			},

			{
				"<leader>ts",
				"<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })<cr>",
			},

			{
				"<leader>tr",
				"<cmd>lua require('telescope.builtin').resume()<cr>",
			},

			{
				"<leader>lef",
				"<cmd>lua require('telescope.builtin').lsp_references()<cr>",
			},

			{
				"<leader>go",
				"<cmd>lua require('telescope.builtin').git_status()<cr>",
			},
			{
				"<leader>gcc",
				"<cmd>lua require('telescope.builtin').git_commits()<cr>",
			},
			{
				"<leader>gcb",
				"<cmd>lua require('telescope.builtin').git_bcommits()<cr>",
			},
		},
	},
}
