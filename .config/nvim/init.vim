" Basic config, taken mostly from https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84
set termguicolors
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set rnu
set wildmode=longest,list   " get bash-like tab completions
set splitright

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

filetype plugin indent on   "allow auto-indenting depending on file type
filetype plugin on
syntax on                   " syntax highlighting

set clipboard=unnamedplus   " using system clipboard
set ttyfast                 " Speed up scrolling in Vim

call plug#begin()
    Plug 'doums/darcula'
    Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
    Plug 'nvim-tree/nvim-tree.lua'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp' 
    Plug 'hrsh7th/cmp-nvim-lsp' 
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'windwp/nvim-autopairs'
call plug#end()

colorscheme darcula

" Neovide
if exists("g:neovide")
    set guifont=JetBrains\ Mono:h16
    let g:neovide_scale_factor=0.75
    let g:neovide_cursor_animation_length=0
endif

" === MAPPINGS ===

" Tab management
nmap <a-n> :tabnew<CR>
nmap <a-x> :tabclose<CR>
nmap <a-/> :tabonly<CR>
nmap <a-k> :tabn<CR>
nmap <a-j> :tabp<CR>
nmap <a-J> :-tabmove<CR>
nmap <a-K> :+tabmove<CR>

" Window
nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l
nnoremap <a-s> <c-w>r
nmap <C-CR> :vnew<CR>
nmap <a-q> :only<CR>
nnoremap <a-t> <c-w>T       " Move to new tab page

" Editor
nmap <C-s> :w<CR>
nmap <S-CR> o<ESC>
nmap <esc> :let @/ = ""<CR>
nmap <F1> :tab help<CR>
nnoremap D dd
nnoremap Z ZZ

" Plugins 

nmap <A-f> :NvimTreeToggle<CR>
nmap <A-z> :NvimTreeFindFile<CR>

" Config
nmap ,r :source ~/.config/nvim/init.vim<CR>
nmap ,e :e ~/.config/nvim/init.vim<CR>


" Plugin config
lua << EOF

require("nvim-tree").setup({
    view = {
        mappings = {
            custom_only = false,
            list = {
                {key = "h", action = "close_node" },
                {key = "j", action = "" },
                {key = "k", action = "" },
                {key = "l", action = "edit" },
                {key = "L", action = "tabnew" },
                {key = "s", action = "vsplit" },
                {key = "<Tab>", action = "preview" },
                {key = "H", action = "toggle_dotfiles" },
                {key = "a", action = "create" },
                {key = "d", action = "remove" },
                {key = "r", action = "rename" },
                {key = "x", action = "cut" },
                {key = "c", action = "copy" },
                {key = "p", action = "paste" },
                {key = "<C-r>", action = "full_rename" },
                {key = "f", action = "live_filter" },
                {key = "F", action = "clear_live_filter" },
                {key = "S", action = "search_node" },
            }
        }
    }
})

EOF
