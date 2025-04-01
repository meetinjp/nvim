vim.g.mapleader = " "

local function fold_all()
	vim.o.foldlevel = 0
	vim.o.foldlevelstart = 0
end

local function unfold_all()
	vim.o.foldlevel = 99
	vim.o.foldlevelstart = 99
end

vim.keymap.set("n", "<leader>ff", fold_all)
vim.keymap.set("n", "<leader>fu", unfold_all)

vim.keymap.set("n", "<Esc>", "<cmd>nohl<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

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

local function replace_curly_quotes()
	pcall(function()
		vim.cmd(':%s/[„“”]/"/g')
	end)
	pcall(function()
		vim.cmd(":%s/[‚’‘’‛’]/'/g")
	end)
end

vim.keymap.set("n", "<leader>sq", replace_curly_quotes)
vim.keymap.set("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<cr>", { silent = true })

vim.keymap.set("n", "<leader>pwc", "<cmd>echo wordcount().words<cr>")

vim.keymap.set("n", "<leader>bc", "<cmd>%bd|e#<cr>")
vim.keymap.set("n", "<leader>bl", "<cmd>buffers<cr>")

vim.keymap.set("n", "<leader>tm", function()
	_G.is_copilot_enabled = true

	vim.diagnostic.enable(not vim.diagnostic.is_enabled())

	if _G.is_copilot_enabled then
		vim.cmd(":Copilot disable")
	else
		vim.cmd(":Copilot enable")
	end
	_G.is_copilot_enabled = not _G.is_copilot_enabled
end)
