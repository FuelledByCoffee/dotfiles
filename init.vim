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
": }}}



call plug#begin(s:home.'/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " Show git brach in statusline
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'bfrg/vim-cpp-modern' " syntax highlighting
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'rhysd/vim-clang-format'

if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  " Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'albertoCaroM/completion-tmux'
  " Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
endif

call plug#end()




" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif


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

xnoremap <tab>   >gv
xnoremap <s-tab> <gv

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

": }}}

": Functions {{{
function! ToggleMinimal()
  AirlineToggle
  " GitGutterBufferToggle
  set nu! rnu!
  set showcmd!
  " set showmode!
  if &ls == 2
    set ls=0
    " set fdc=3
  else
    set ls=2
    " set fdc=0
  endif
endfun
" command! Minimal :call ToggleMinimal()
" nnoremap <c-o> :call ToggleMinimal()<cr>

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

if has('termguicolors')
  set t_8b=\<esc>[48;2;%lu;%lu;%lum
  set t_8f=\<esc>[38;2;%lu;%lu;%lum
  set termguicolors
endif


set noshowmode

set encoding=UTF-8

set hidden

set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set completeopt+=preview

set rtp+=/opt/homebrew/opt/fzf

set shortmess+=c

set belloff+=ctrlg

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
set cindent
set preserveindent

set grepprg=rg

set wrap
set breakindent

set scrolloff=7
set sidescrolloff=5

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

let g:termdebug_popup = 0
" let g:termdebug_wide = 163

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

": Tagbar {{{
nnoremap <silent> <leader>b :TagbarToggle<CR>
": }}}

": NerdTree {{{

" Disable built in file manager
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

nnoremap <silent> <leader>e :NERDTreeToggle<CR>

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

map <silent> mm <Plug>NERDCommenterToggle
": }}}

": clang-format {{{
map <silent> <leader>f :ClangFormat<cr>
": }}}

": airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline_detect_modified = 0
let g:airline_skip_empty_sections = 0

" let g:airline_left_sep=''
" let g:airline_right_sep=''
": }}}

": Language server {{{
if has('nvim')
  autocmd BufEnter * lua require'completion'.on_attach()
  " Language server protocol mappings
  nnoremap <silent> H     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <C-F> <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <silent> gq    <cmd>lua vim.lsp.buf.formatting()<CR>
  vnoremap <silent> gq    <cmd>lua vim.lsp.buf.formatting()<CR><ESC>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> gD    :tab split<CR><cmd>lua vim.lsp.buf.definition()<CR>
  " Show diagnostic on hover
  autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
  " Enable integrated highlight on yank
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("YankRegion", 1000)

  let g:completion_chain_complete_list = {
        \ 'default': {'comment': [],
        \ 'default': [{'complete_items': [ 'lsp', 'tmux' ]},
        \  {'mode': '<c-p>'}, {'mode': '<c-n>'}]}}

  lua require'lspconfig'.pyright.setup{}
  lua require'lspconfig'.clangd.setup{}

endif
": }}}

": colorizer {{{
if has('nvim')
  lua require'colorizer'.setup()
endif
": }}}

": vim-lsp-cxx-highlight {{{
" if has('nvim')
"   let g:lsp_cxx_hl_use_nvim_text_props = 1
" else
"   let g:lsp_cxx_hl_use_text_props = 1
" endif

" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1
": }}}

": Colorscheme {{{

colorscheme gruvbox

" No background color. Persist after setting colorscheme.
" Only sets when colorsceme is set
au colorscheme * highlight Normal           ctermbg=none guibg=none
au colorscheme * highlight NonText          ctermbg=none guibg=none
au colorscheme * highlight Text             ctermbg=none guibg=none
au colorscheme * highlight LineNr           ctermbg=none guibg=none
au colorscheme * highlight CursorLineNR     ctermbg=none guibg=none
au colorscheme * highlight folded           ctermbg=none guibg=none
" au colorscheme * highlight SignColumn       guibg=none ctermbg=none
" au colorscheme * highlight FoldColumn       guibg=none ctermbg=none
" au colorscheme * highlight GitGutterAdd     guibg=none ctermbg=none
" au colorscheme * highlight GitGutterChange  guibg=none ctermbg=none
" au colorscheme * highlight GitGutterDelete  guibg=none ctermbg=none
au colorscheme * highlight EndOfBuffer      guifg=black ctermfg=black

set background=dark

": }}}
