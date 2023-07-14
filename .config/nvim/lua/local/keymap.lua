local keymap = vim.keymap.set

local opts = { silent = true, noremap = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

function map_all(mode, table)
    for k, v in pairs(table) do
        keymap("n", k, v, opts)
    end
end

map_all("n", {
    
    [";"] = ":",

    -- Buffers
    ["<A-j>"] = ":bprevious<CR>",
    ["<A-k>"] = ":bnext<CR>",
    ["Z"] = ":Bdelete<CR>",
    ["<A-.>"] = ":BufferLineMoveNext<CR>",
    ["<A-,>"] = ":BufferLineMovePrev<CR>",
    ["<A-/>"] = ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>",
    ["<A-n>"] = ":enew<CR>",

    -- Windows
    ["<A-h>"] = "<C-w>h",
    ["<A-l>"] = "<C-w>l",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<A-i>"] = ":vsplit<CR><C-w>l<CR>",
    ["<A-x>"] = "ZZ",
    ["<A-q>"] = "ZZ",
    ["<A-u>"] = ":only<CR>",

    -- Tabs
    ["<C-h>"] = ":tabprev<CR>",
    ["<C-l>"] = ":tabnext<CR>",
    ["<leader>t"] = ":tabnew<CR>",

    -- Editor
    ["D"] = "dd",
    ["<C-s>"] = ":w<CR>",
    ["<S-CR>"] = "o<Esc>",
    ["<Esc>"] = ':let @/ = ""<CR>',

    -- NvimTree 
    ["<A-f>"] = ":NvimTreeToggle<CR>",
    ["<A-z>"] = ":NvimTreeFindFile<CR>",

    -- Nvim actions
    [",r"] = ":w | :source %<CR>",
    [",e"] = ":e ~/.config/nvim<CR>",
    [",p"] = ":source .config/nvim/lua/local/plugins.lua | :PackerSync<CR>",
    ["<leader>H"] = ":tab h<CR>",
    ["<leader>h"] = ":help<space>",

})

