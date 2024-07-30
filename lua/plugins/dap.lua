return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>db",
				"<cmd>lua require('dap').toggle_breakpoint()<cr>",
			},
			{ "<leader>dxb", "<cmd>lua require('dap').toggle_breakpoint(\"\")<Left><Left>" },

			{
				"<leader>dc",
				"<cmd>lua require('dap').continue()<cr>",
			},
			{
				"<leader>dg",
				"<cmd>lua require('dap').run_to_cursor()<cr>",
			},
			{
				"<leader>dt",
				"<cmd>lua require('dap').terminate()<cr>",
			},
			{
				"<leader>dr",
				"<cmd>lua require('dap').restart()<cr>",
			},

			{
				"<leader>di",
				"<cmd>lua require('dap').step_into()<cr>",
			},
			{
				"<leader>do",
				"<cmd>lua require('dap').step_over()<cr>",
			},
			{
				"<leader>da",
				"<cmd>lua require('dap').step_out()<cr>",
			},
		},
	},
}
