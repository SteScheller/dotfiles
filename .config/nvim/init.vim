"##############################################################################
" general
"##############################################################################
set encoding=utf-8
set expandtab       " tab to spaces
set tabstop=4       " tab intendation width
set shiftwidth=4    " width for automatic intendation
set nobackup        " dont keep backup files
set autoread        " automatically reload files changed on disk

" Enable folding
set foldmethod=indent
set foldlevel=99


if has("syntax")
    set number relativenumber
    set autoindent
    syntax on
    set colorcolumn=80
endif

"##############################################################################
" keyboard shortcuts
"##############################################################################
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" automatically close brackets and place cursor inbetween

" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i
" automatically close quotation marks and place cursor inbetween

" fold code with space
nnoremap <Space> za

" repeat last macro
nnoremap <C-Space> @@

" Explore files in current window
nnoremap <C-E> :Explore<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

"##############################################################################
" autocommands
"##############################################################################
autocmd FileType c,cpp,java,php,python,glsl autocmd BufWritePre <buffer> %s/\s\+$//e
" remove trailing whitespaces in specified files

"##############################################################################
" vim-plug
"##############################################################################
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Shorthand notation; fetches httpf://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'tikhomirov/vim-glsl'

" on demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

"##############################################################################
" misc plugins
"##############################################################################
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

colorscheme jellybeans
hi Normal guibg=NONE ctermbg=NONE

