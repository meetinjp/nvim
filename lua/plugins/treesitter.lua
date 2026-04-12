return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		init = function()
			local installed = require("nvim-treesitter.config").get_installed()
			local want = { "lua", "typescript", "rust", "c" }
			local to_install = vim.tbl_filter(function(p)
				return not vim.tbl_contains(installed, p)
			end, want)

			if #to_install > 0 then
				require("nvim-treesitter").install(to_install)
			end

			-- Enable highlighting + indentation per filetype
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
