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
" automatically close brackets and place cursor inbetween
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i

" automatically close quotation marks and place cursor inbetween
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i

" fold code with space
nnoremap <Space> za

" repeat last macro
nnoremap <C-Space> @@

" Explore files in current window
nnoremap <C-E> :Explore<CR>

" tabs
nnoremap <C-N> :tabnew<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" close window
nnoremap <C-D> :q<CR>

" quick splits
nnoremap <C-V> <C-W>v
nnoremap <C-S> <C-W>s

" latex-suite maps
imap <C-B> <Plug>IMAP_JumpBack
nmap <C-B> <Plug>IMAP_JumpBack
vmap <C-B> <Plug>IMAP_JumpBack
imap <C-P> <Plug>IMAP_JumpForward
nmap <C-P> <Plug>IMAP_JumpForward
vmap <C-P> <Plug>IMAP_JumpForward
imap <F6> <Plug>Tex_FastEnvironmentInsert
nmap <F6> <Plug>Tex_FastEnvironmentInsert
vmap <F6> <Plug>Tex_FastEnvironmentInsert


" split navigations
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
" -> this was previously remapped in autocommand group on_startup to 
"  overwrite the mapping from vim-latex:
"    autocmd VimEnter * unmap <C-J>
"    autocmd VimEnter * nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" IDE features from with YCM
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>rr :YcmCompleter RefactorRename 
nnoremap <leader>pd :YcmCompleter GetDoc<CR>
nnoremap <leader>pt :YcmCompleter GetType<CR>
nnoremap <leader>pp :YcmCompleter GetParent<CR>

" reload externally changed files
nnoremap <F5> :checktime<CR>

"##############################################################################
" autocommands
"##############################################################################
" create autocommand groups such that autocommands are replaced instead of
" chaines when init.vim is sourced again
augroup filetype_specific_commands
    autocmd!
    "autocmd FileType c,cpp,java,php,python,glsl,tex autocmd BufWritePre <buffer> %s/\s\+$//e
    autocmd FileType c,cpp,java,php,python,glsl autocmd BufWritePre <buffer> %s/\s\+$//e
    " remove trailing whitespaces in specified files
    autocmd BufNewFile,BufRead *.inc set filetype=tex
    " set LaTex syntax highlighting for inc files
augroup END

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
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'tikhomirov/vim-glsl'
" Plug 'ActivityWatch/aw-watcher-vim'
Plug 'vim-latex/vim-latex'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

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

let g:Tex_Flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'ps2pdf $*'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_dvi = 'cd build && xdvi'
let g:Tex_ViewRule_ps =	'cd build && ghostview'
"let g:Tex_ViewRule_pdf = 'cd build && zathura'
let g:Tex_ViewRule_pdf = 'zathura'
"let g:Tex_CompileRule_pdf = 'latexmk -pdf -outdir=build -interaction=nonstopmode -shell-escape $*'
let g:Tex_UseMakefile = 1

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

set background=dark
"colorscheme jellybeans
"colorscheme gruvbox
colorscheme PaperColor
hi Normal guibg=NONE ctermbg=NONE

