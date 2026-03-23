return {
	"laytan/cloak.nvim",
	lazy = false,
	opts = {
		-- Whether it should try every pattern to find the best fit or stop after the first.
		try_all_patterns = true,
		-- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
		cloak_telescope = true,
		-- Re-enable cloak when a matched buffer leaves the window.
		cloak_on_leave = true,
		patterns = {
			{
				file_pattern = { ".env*", "aws*" },
				cloak_pattern = { "=.+", ":.+", "-.+" },
				-- A function, table or string to generate the replacement.
				-- The actual replacement will contain the 'cloak_character'
				-- where it doesn't cover the original text.
				-- If left empty the legacy behavior of keeping the first character is retained.
				replace = nil,
			},
		},
	},
	keys = {
		{ "<leader>tc", "<cmd>CloakToggle<cr>" },
	},
}
