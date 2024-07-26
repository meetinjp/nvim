vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		vim.cmd("set formatoptions-=cro") -- comments
	end,
})
