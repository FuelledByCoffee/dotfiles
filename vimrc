let mapleader = ','

inoremap jj <esc>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>Q :qa<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>r :make test<cr>

nnoremap <silent><tab>    :bnext<cr>
nnoremap <silent><s-tab>  :bNext<cr>
nnoremap <silent>t<tab>   :tnext<cr>
nnoremap <silent>t<s-tab> :tNext<cr>
nnoremap <silent>ø zA

nnoremap <silent> // :noh<cr>
nnoremap <silent><leader>\| <C-W>L

xnoremap <tab>   >gv
xnoremap <s-tab> <gv

" Move between splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap <silent> √ :move+<CR>
nnoremap <silent> ª :move-2<CR>

nnoremap <silent> // :noh<cr>

" Navigate through quick-fix errors
nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>
nnoremap <silent>co :copen<CR>
nnoremap <silent>cc :cclose<CR>


inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

syntax on

set mouse=a
set number
set autoread
set hidden
set nobackup
set nowritebackup
set hlsearch
set incsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set smartindent
set smarttab
set scrolloff=7
set sidescrolloff=5
set nobackup
set nowritebackup
set undolevels=100    " How many undos
set undoreload=1000   " number of lines to save for undo
set undofile          " Save undos after file closes
set completeopt=menu,menuone,noselect,noinsert,preview
set shortmess+=c

filetype plugin on
filetype indent on

hi LineNr           ctermfg=grey
hi Statement        ctermfg=darkyellow
" hi Special          ctermfg=yellow

" jump to previous position when reopening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\""
      \| endif
