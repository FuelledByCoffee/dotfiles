
let mapleader = ','
let maplocalleader=" "

" Press jj to escape from insert mode
inoremap jj <esc>

" Quickly save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>Q :qa<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>r :make test<cr>

nnoremap <silent><tab>   :bnext<cr>
nnoremap <silent><s-tab> :bNext<cr>

xnoremap <tab>   >gv
xnoremap <s-tab> <gv

" Cancel search highlight
nnoremap <silent> // :noh<cr>

inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

syntax on

set mouse=a
set number
set autoread
set hidden
set nobackup
set nowritebackup

filetype plugin on
filetype indent on
