return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>bb", vim.cmd.BufferLineCyclePrev },
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{ "<leader>dxb", ":lua require('dap').toggle_breakpoint(\"\")<Left><Left>" },

			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
			},
			{
				"<leader>dg",
				function()
					require("dap").run_to_cursor()
				end,
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
			},
			{
				"<leader>dr",
				function()
					require("dap").restart()
				end,
			},

			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
			},
			{
				"<leader>da",
				function()
					require("dap").step_out()
				end,
			},
		},
	},
}
