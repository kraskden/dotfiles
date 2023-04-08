-- Disable standart file manager
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {
	backup = false, 
	clipboard = "unnamedplus", 
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", 
	hlsearch = true, 
    incsearch = true,
	ignorecase = true,
	mouse = "a", 
	pumheight = 10, -- pop up menu height
	showmode = false, 
	smartcase = true, 
	smartindent = true, 
	splitbelow = true, 
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable Navigation
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false,
	expandtab = true, 
	shiftwidth = 4, 
	tabstop = 4, 
	cursorline = false, 
	number = true, 
	relativenumber = true, 
	numberwidth = 2, -- set number column width to 2 {default 4}
	wrap = false, -- display lines as one long line
	scrolloff = 8, 
	sidescrolloff = 8,
	laststatus = 0,
	virtualedit = "onemore",
	linebreak = true,
	showtabline = 1,
	spelllang = "en_us",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.iskeyword:append("-")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.cinkeys:remove(":")
vim.opt.indentkeys:remove(":")

