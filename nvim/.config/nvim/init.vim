inoremap jk <Esc>
set cursorline
syntax on
set number

" clipboard system
set clipboard=unnamedplus

call plug#begin()
Plug 'ncm2/ncm2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()
