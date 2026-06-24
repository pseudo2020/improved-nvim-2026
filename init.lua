-- Basic Settings
vim.opt.number = true
--vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.mouse = ""
vim.opt.laststatus = 2
vim.opt.scrolloff = 12 
vim.opt.sidescrolloff = 8
vim.cmd("colorscheme habamax")

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Filetype Plugins
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Match Brackets
vim.opt.showmatch = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Autocompletion (Omnicomplete)
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.omnifunc = "syntaxcomplete#Complete"

-- Disable Swap & Backup files
--vim.opt.noswapfile = true
--vim.opt.nobackup = true
--vim.opt.nowritebackup = true

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Key Mappings
vim.keymap.set({ "i", "v", "s" }, "<C-k>", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("n", "<leader>bn", ":bn<CR>")
vim.keymap.set("n", "<leader>bp", ":bp<CR>")
vim.keymap.set("n", "<leader>bc", ":bd<CR>")
vim.keymap.set("n", "<leader>bd", ":bd!<CR>")

vim.keymap.set("n", "<leader>h", ":nohl<CR>")
vim.keymap.set("n", "<leader>/", ":set incsearch<CR>/")

-- Make
vim.opt.makeprg = "make"
--vim.keymap.set("n", "<leader>m", ":make<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>m", function()
	vim.cmd("write")
	vim.cmd("make")

	local qflist = vim.fn.getqflist()
	if #qflist > 0 then
		vim.cmd("copen")
	end
end)

-- Terminal
vim.keymap.set("n", "<leader>tf", ":terminal<CR>")
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("botright split")
	vim.cmd("resize 15")
	vim.cmd("terminal")
	vim.cmd("startinsert")
end)
vim.keymap.set("n", "<leader>tv", function()
	vim.cmd("botright vsplit")
	vim.cmd("terminal")
	vim.cmd("startinsert")
end)
vim.keymap.set("n", "<leader>tc", ":bd!<CR>")
vim.keymap.set("t", "<C-k>", [[<C-\><C-n>]])
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.cmd("startinsert")
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})
