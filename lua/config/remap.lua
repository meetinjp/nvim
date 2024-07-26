vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ff", function()
	vim.o.foldlevel = 0
	vim.o.foldlevelstart = 0
end)
vim.keymap.set("n", "<leader>fu", function()
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
end)

vim.keymap.set("n", "<Esc>", vim.cmd.nohl)
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

vim.keymap.set("n", "<leader>c", vim.cmd.bd)

vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>sq", function()
	pcall(function()
		vim.cmd(':%s/[„“”]/"/g')
	end)
	pcall(function()
		vim.cmd(":%s/[‚’‘’‛’]/'/g")
	end)
end)

vim.keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<cr>", { silent = true })

vim.keymap.set("n", "<leader><leader>", "<cmd>so<cr>")

vim.keymap.set("n", "<leader>pwc", "<cmd>echo wordcount().words<cr>")
