" vim:foldmethod=marker
""""""""""""""""""""
"     init.vim     "
""""""""""""""""""""

": Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " Show git brach in statusline
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'preservim/tagbar'
"Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neomake/neomake'
" Plug 'dense-analysis/ale'
" Plug 'airblade/vim-gitgutter'
Plug 'cdelledonne/vim-cmake'
" Plug 'sheerun/vim-polyglot'
Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

": NerdTree {{{

" Disable built in file manager
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Open NERDTree immediately when starting neovim
" autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p
" Automatically quit if NERDTree is the only open window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
": }}}

": Nerdcommenter {{{
" Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
" " Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
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

": GitGutter {{{
"let g:gitgutter_preview_win_floating=1
": }}}

": Neomake {{{
" let g:neomake_c_enabled_makers=['clang']
" let g:neomake_c_clang_args=['-WCL4 -Wshadow std=c18']
 "if MyOnBattery()
   "call neomake#configure#automake('w')
 "else
   "call neomake#configure#automake('nw', 1000)
 "endif

": }}}

": coc {{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
": }}}

": Lsp {{{
"if executable('clangd')
  "augroup lsp_clangd
    "autocmd!
    "autocmd User lsp_setup call lsp#register_server({
          "\ 'name': 'clangd',
          "\ 'cmd': {server_info->['clangd']},
          "\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
          "\ })
    "autocmd FileType c setlocal omnifunc=lsp#complete
    "autocmd FileType cpp setlocal omnifunc=lsp#complete
    "autocmd FileType objc setlocal omnifunc=lsp#complete
    "autocmd FileType objcpp setlocal omnifunc=lsp#complete
  "augroup end
"endif
": }}}
": }}}

": Key maps {{{
let mapleader = ','

" Press jj to escape from insert mode
inoremap jj <esc>

" Quickly save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>r :ctest -j4<cr>

" Escape from terminal mode
tnoremap <Esc> <C-\><C-n>

" Search by pressing space
nnoremap <space> /

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

nnoremap <Down>     <C-W><C-J>
nnoremap <Up>       <C-W><C-K>
nnoremap <Right>    <C-W><C-L>
nnoremap <Left>     <C-W><C-H>

" Navigate through quick-fix errors
nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>
nnoremap co :lopen<CR>
nnoremap cc :lclose<CR>

noremap <silent> <leader>e :NERDTreeToggle<CR>
noremap <silent> <leader>b :TagbarToggle<CR>

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

function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elsif has('unix')
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endif
return 0
endfunction
": }}}

": Settings {{{
set relativenumber
set number
set cursorline

set noshowmode

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

set wrap
set breakindent

set scrolloff=7
set mouse=a

" Open new splits to the right and one the bottom
" set splitbelow
set splitright

filetype plugin on
filetype indent on

": }}}

": Configuration {{{

" Reset pager variable to use nvim for man pages
let $PAGER=''

" Default is using c++ syntax for .h files
" Use C syntax for .h files
let g:c_syntax_for_h=1

"Textbox moves with cursor
let g:lsp_cxx_hl_use_text_props = 1

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

" No background color. Persist after setting colorscheme.
" Only sets when colorsceme is set
au colorscheme * highlight Normal	          ctermbg=none
au colorscheme * highlight NonText	        ctermbg=none
au colorscheme * highlight Text		          ctermbg=none
au colorscheme * highlight LineNr	          ctermbg=none ctermfg=grey
"au colorscheme * highlight CursorLineNR    ctermbg=none
"au colorscheme * highlight SignColumn      guibg=none ctermbg=none
"au colorscheme * highlight FoldColumn      guibg=none ctermbg=none
au colorscheme * highlight GitGutterAdd     guibg=none ctermbg=none
au colorscheme * highlight GitGutterChange  guibg=none ctermbg=none
au colorscheme * highlight GitGutterDelete  guibg=none ctermbg=none

colorscheme gruvbox

" set background=dark " for the dark version
" set background=light " for the light version

": }}}