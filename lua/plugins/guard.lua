return {
	-- 	{
	-- 		"nvimdev/guard.nvim",
	-- 		dependencies = {
	-- 			"nvimdev/guard-collection",
	-- 		},
	-- 		config = function()
	-- 			require("guard").setup({
	-- 				fmt_on_save = false,
	-- 				lsp_as_default_formatter = true,
	-- 			})

	-- 			local ft = require("guard.filetype")

	-- 			ft("cpp"):lint("clang-tidy")
	-- 			ft("typescript,javascript,typescriptreact,javascriptreact"):lint({
	-- 				cmd = "eslint",
	-- 				find = {
	-- 					".eslintrc.js",
	-- 					".eslintrc.cjs",
	-- 					".eslintrc.yaml",
	-- 					".eslintrc.yml",
	-- 					".eslintrc.json",
	-- 				},
	-- 			})
	-- 		end,
	-- 	},
}
