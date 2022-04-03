let mapleader = ','
let g:c_syntax_for_h=1
let @/ = "" " Don't highlight after source vimrc

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

xnoremap <tab>   >gv
xnoremap <S-tab> <gv

inoremap <expr> <tab>   pumvisible() ? "\<C-n>" : "<tab>"
inoremap <expr> <S-tab> pumvisible() ? "\<C-p>" : "<S-tab>"

nnoremap <silent>ø zA

nnoremap <silent> // :noh<cr>
nnoremap <silent><leader>\| <C-W>L

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

nnoremap <leader>y "*y
nnoremap <leader>p "*p

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
set foldlevel=0
set foldmethod=marker
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
set wildmenu
set wildignorecase    " case is ignored when completing file names and directories
set shortmess+=c      " Silence insert completion messages
set completeopt=menu,menuone,noselect,preview
set omnifunc=syntaxcomplete#Complete

filetype plugin on
filetype indent on

" hi Special      ctermfg=yellow
hi Comment            ctermfg=Grey
hi LineNr             ctermfg=Grey
hi Statement          ctermfg=DarkYellow
hi Folded             ctermfg=Black
hi Folded             ctermbg=DarkGrey
hi Pmenu              ctermbg=DarkGrey

hi VimOption          ctermfg=DarkCyan
hi VimHiCtermcolor    ctermfg=DarkCyan
hi VimMapMod          ctermfg=DarkGrey
hi VimMapModKey       ctermfg=DarkBlue
hi VimNotation        ctermfg=DarkBlue
hi VimBracket         ctermfg=DarkGrey

" jump to previous position when reopening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\""
      \| endif


" Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <F2> :call <SID>SynStack()<CR>


function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
nnoremap <leader><space> :call TrimWhitespace()<cr>

function! IsTriggerChar()
  return (v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z') || (v:char == '.')
endfunction

function! OpenCompletion()
    if !pumvisible() && IsTriggerChar()
        call feedkeys("\<C-x>\<C-o>", "n")
    endif
endfunction
autocmd InsertCharPre * call OpenCompletion()

