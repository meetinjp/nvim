return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
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
				function()
					require("telescope.builtin").find_files()
				end,
			},
			{
				"<C-p>",
				function()
					require("telescope.builtin").git_files()
				end,
			},
			{
				"<C-g>",
				function()
					require("telescope.builtin").live_grep()
				end,
			},
			{
				"<leader>sg",
				function()
					require("telescope.builtin").grep_string()
				end,
			},

			{
				"<leader>ts",
				function()
					require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
				end,
			},

			{
				"<leader>tr",
				function()
					require("telescope.builtin").resume()
				end,
			},

			{
				"<leader>lef",
				function()
					require("telescope.builtin").lsp_references()
				end,
			},

			{
				"<leader>go",
				function()
					require("telescope.builtin").git_status()
				end,
			},
			{
				"<leader>gcc",
				function()
					require("telescope.builtin").git_commits()
				end,
			},
			{
				"<leader>gcb",
				function()
					require("telescope.builtin").git_bcommits()
				end,
			},
		},
	},
}
