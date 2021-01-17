""""""""""""""""""""
"     init.vim     "
""""""""""""""""""""

": Plugins {{{

": Install vim-plug if not found {{{
if has('nvim')
  let s:home = $HOME.'/.config/nvim/'
else
  let s:home = $HOME.'/.vim/'
endif
let s:vim_plug_dir=expand(s:home.'/autoload')

if !filereadable(s:vim_plug_dir.'/plug.vim')
  exe '!wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P '.s:vim_plug_dir
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif
": }}}

call plug#begin(s:home.'/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " Show git brach in statusline
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
" Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'bfrg/vim-cpp-modern' " syntax highlighting
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

": NerdTree {{{

" Disable built in file manager
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

noremap <silent> <leader>e :NERDTreeToggle<CR>

" Open NERDTree immediately when starting neovim
" autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p
" Automatically quit if NERDTree is the only open window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
": }}}

": Nerdcommenter {{{
" Create default mappings
let g:NERDCreateDefaultMappings = 0

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }

map mm <Plug>NERDCommenterToggle
": }}}

": airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
"let g:airline_left_sep=''
"let g:airline_right_sep=''
": }}}

": vim-lsp-cxx-highlight {{{
if has('nvim')
  let g:lsp_cxx_hl_use_nvim_text_props = 1
else
  let g:lsp_cxx_hl_use_text_props = 1
endif
": }}}


": }}}

": Key maps {{{
let mapleader = ','
let maplocalleader=" "

" Press jj to escape from insert mode
inoremap jj <esc>

" Quickly save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa<cr>
nnoremap <leader>m :make<cr>

" Escape from terminal mode
tnoremap <Esc> <C-\><C-n>

" Cancel search highlight
nnoremap <silent> // :noh<cr>

" Move vertically by visual line. Useful when long lines wrap.
nnoremap <silent> j gj
nnoremap <silent> k gk

"--- some brilliant line movement mappings from junegunn ---"
" move current line up/down
nnoremap <silent> <S-Up>    :move-2<CR>
nnoremap <silent> <S-Down>  :move+<CR>

nnoremap <tab>   :bnext<cr>
nnoremap <s-tab> :bNext<cr>

xnoremap <tab> >
xnoremap <s-tab> <

" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"map <C-j> :cn<CR>
"map <C-k> :cp<CR>

nnoremap <Down>     <C-W><C-J>
nnoremap <Up>       <C-W><C-K>
nnoremap <Right>    <C-W><C-L>
nnoremap <Left>     <C-W><C-H>

" Navigate through quick-fix errors
nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>
nnoremap co :copen<CR>
nnoremap cc :cclose<CR>

" clang-format
noremap <silent> <leader>f :pyf /usr/local/Cellar/clang-format/*/share/clang/clang-format.py<cr>
": }}}

": Functions {{{
function! ToggleMinimal()
  AirlineToggle
  GitGutterBufferToggle
  set nu! rnu!
  if &ls == 2
    set ls=0
    set fdc=3
  else
    set ls=2
    set fdc=0
  endif
endfun
command! Minimal :call ToggleMinimal()

function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
" command! TrimWhiteSpace ':%s/\s\+$//gI'
nnoremap <leader><space> :call TrimWhitespace()<cr>

function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction
": }}}

": Settings {{{
set nocompatible

set relativenumber
set number
set cursorline

if ('+termguicolors')
  set t_8b=\<esc>[48;2;%lu;%lu;%lum
  set t_8f=\<esc>[38;2;%lu;%lu;%lum
  set termguicolors
endif


set noshowmode

set encoding=UTF-8

set hidden

set wildmenu
set wildmode=full

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set ignorecase
set smartcase

set hlsearch
set incsearch

set smarttab
set smartindent
set copyindent
set autoindent
set preserveindent

set grepprg=rg

set wrap
set breakindent

set scrolloff=7
set mouse=a

set undolevels=100    " How many undos
set undoreload=1000   " number of lines to save for undo
if has('nvim')
  set undodir=$HOME/.config/nvim/undo-history
else
  set undodir=$HOME/.vim/undo-history
endif
set undofile          " Save undos after file closes

" set splitbelow
set splitright

filetype plugin on
filetype indent on

": }}}

": commands {{{
command! W :execute 'silent w !sudo tee % > /dev/null' | :edit!
": }}}

": Configuration {{{

" Reset pager variable to use nvim for man pages
let $MANPAGER=''

" Default is using c++ syntax for .h files
" Use C syntax for .h files
let g:c_syntax_for_h=1

" jump to previous position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if executable('vimscript-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'vimscript-language-server',
        \ 'cmd': {server_info->WrapLspTee(['vimscript-language-server'])},
        \ 'whitelist': ['vim'],
        \ })
endif

": }}}

": Colorscheme {{{

colorscheme gruvbox

" No background color. Persist after setting colorscheme.
" Only sets when colorsceme is set
au colorscheme * highlight Normal           ctermbg=none
au colorscheme * highlight NonText	        ctermbg=none
au colorscheme * highlight Text		          ctermbg=none
au colorscheme * highlight LineNr	          ctermbg=none ctermfg=grey
au colorscheme * highlight CursorLineNR     ctermbg=none ctermfg=yellow
" au colorscheme * highlight SignColumn      guibg=none ctermbg=none
" au colorscheme * highlight FoldColumn      guibg=none ctermbg=none
" au colorscheme * highlight GitGutterAdd     guibg=none ctermbg=none
" au colorscheme * highlight GitGutterChange  guibg=none ctermbg=none
" au colorscheme * highlight GitGutterDelete  guibg=none ctermbg=none
au colorscheme * highlight EndOfBuffer ctermfg=black ctermbg=black

set background=dark

": }}}

" vim:foldmethod=marker
