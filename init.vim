" vim: foldlevel=0

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

if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/playground'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'christianchiarulli/nvcode-color-schemes.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'hrsh7th/nvim-compe'
  " Plug 'andersevenrud/compe-tmux'
  Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
  " Plug 'glepnir/lspsaga.nvim'
else
  Plug 'bfrg/vim-cpp-modern' " syntax highlighting
  Plug 'cespare/vim-toml'
endif
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ARM9/arm-syntax-vim'
Plug 'zigford/vim-powershell'
Plug 'lifepillar/vim-gruvbox8'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'alvan/vim-closetag'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'

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
nnoremap <leader>d :bd<cr>
nnoremap <leader>Q :qa<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>r :make test<cr>

nnoremap <localleader>- <cmd>Telescope buffers<CR>
nnoremap <localleader>g <cmd>Telescope git_files<CR>
nnoremap <localleader>r <cmd>Telescope live_grep<CR>
nnoremap <localleader>o <cmd>Telescope file_browser<CR>
nnoremap <localleader>n <cmd>Telescope find_files<CR>
nnoremap <localleader>b <cmd>Telescope git_branches<CR>
nnoremap <localleader>s <cmd>Telescope lsp_document_symbols<CR>
" nnoremap <localleader>F :Telescope grep_string<CR>

" Use tab and shift-tab to go through completion options
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent><tab>   :bnext<cr>
nnoremap <silent><s-tab> :bNext<cr>

xnoremap <tab>   >gv
xnoremap <s-tab> <gv

" Escape from terminal mode
tnoremap <Esc> <C-\><C-n>

" Cancel search highlight
nnoremap <silent> // :noh<cr>

" Move vertically by visual line. Useful when long lines wrap.
nnoremap <silent> j gj
nnoremap <silent> k gk

"--- some brilliant line movement mappings from junegunn ---"
" move current line up/down
" use alt with j/k only works if alt does not send escape
nnoremap <silent> √ :move+<CR>
nnoremap <silent> ª :move-2<CR>

" Move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"map <C-j> :cn<CR>
"map <C-k> :cp<CR>

nnoremap t<tab>   :tabnext<cr>
nnoremap t<s-tab> :tabprevious<cr>

nnoremap <Down>     <C-W><C-J>
nnoremap <Up>       <C-W><C-K>
nnoremap <Right>    <C-W><C-L>
nnoremap <Left>     <C-W><C-H>

" Navigate through quick-fix errors
nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>
nnoremap <silent>co :copen<CR>
nnoremap <silent>cc :cclose<CR>

" Auto close whatever
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

": }}}

": Settings {{{
set number
set cursorline

if exists('$TMUX')
  set t_8b=\<esc>[48;2;%lu;%lu;%lum
  set t_8f=\<esc>[38;2;%lu;%lu;%lum
endif

set showtabline=2
set noshowmode

set encoding=UTF-8

" Required for rename across files
set hidden

" Remove ~ at end of buffer
if has('nvim')
  set fillchars=eob:\ ,fold:\ ,
  set diffopt+=vertical
endif

set updatetime=100

set complete+=spell
set completeopt=menuone,noselect,noinsert,preview

set rtp+=/opt/homebrew/opt/fzf

set shortmess+=c

set belloff+=ctrlg

set wildmenu
set wildmode=longest,list:full

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set ignorecase
set smartcase

set hlsearch
set incsearch
let @/ = "" " Don't highlight after source vimrc

set path=.,/usr/local/include,/usr/include
set path+=$HOME/.local/include
set path+=/Library/Developer/CommandLineTools/usr/include/c++/v1
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include

set smarttab
set smartindent
set copyindent
set autoindent
set cindent
set preserveindent

if has('nvim')
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
endif
set foldlevel=99

set grepprg=rg

set wrap
set breakindent

set scrolloff=7
set sidescrolloff=5

set mouse=a

set signcolumn=yes

set nobackup
set nowritebackup

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

": Configuration {{{

" Reset manpager variable to use nvim for man pages
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

function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return ' ✦ '. foldedlinecount . line
endfunction
set foldtext=MyFoldText()

": }}}

": Functions {{{
" Show syntax highlighting groups for word under cursor
nmap <F2> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
" command! TrimWhiteSpace ':%s/\s\+$//gI'
nnoremap <leader><space> :call TrimWhitespace()<cr>

function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <silent> <Tab> <C-R>=CleverTab()<CR>

function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction


" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  hi FloatWinBorder guifg=#4499f7
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatWinBorder')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

" Open terminal
nnoremap <Leader>at :call FloatTerm()<CR>
" Open tig, yes TIG, A FLOATING TIGGGG!!!!!!
nnoremap <Leader>ag :call FloatTerm('"tig"')<CR>

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height, command)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen(a:command , {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <leader>t :call TermToggle(12, $SHELL)<CR>
nnoremap <leader>r :call TermToggle(12, "make test")<CR>
tnoremap <leader>t <C-\><C-n>:call TermToggle(12, $SHELL)<CR>


": }}}

": Colorscheme {{{

if has('termguicolors')
  set termguicolors
endif

let g:nvcode_termcolors=256

" No background color. Persist after setting colorscheme.
" Only sets when colorsceme is set
au colorscheme * highlight Normal             ctermbg=NONE guibg=NONE
au colorscheme * highlight NonText            ctermbg=NONE guibg=NONE
au colorscheme * highlight Text               ctermbg=NONE guibg=NONE
au colorscheme * highlight LineNr             ctermbg=NONE guibg=NONE
au colorscheme * highlight CursorLineNR       ctermbg=NONE guibg=NONE
au colorscheme * highlight SignColumn         ctermbg=NONE guibg=NONE

" au colorscheme * highlight folded             ctermbg=NONE guibg=NONE
" au colorscheme * highlight FoldColumn         ctermbg=NONE guibg=NONE
au colorscheme * highlight EndOfBuffer      guifg=black ctermfg=black

set background=dark
colorscheme primary
": }}}

": Fugitive {{{
nnoremap         gs :tab Git<CR>
nnoremap <leader>gc :tab Git commit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gP :Git push<CR>
nnoremap         g- :Git stash<CR>:e<CR>
nnoremap         g+ :Git stash pop<CR>:e<CR>
": }}}

": Git gutter {{{
let g:gitgutter_map_keys = 1
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_grep = 'rg'
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 0
let g:gitgutter_preview_win_floating = 1
command! Gqf GitGutterQuickFix | copen
nnoremap <leader>G :Gqf<cr>

nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap         gp <Plug>(GitGutterPreviewHunk)

nmap <leader>g[ <Plug>(GitGutterPrevHunk)
nmap <leader>g] <Plug>(GitGutterNextHunk)

highlight GitGutterAdd          guifg=#00d900 ctermfg=2 ctermbg=NONE guibg=NONE
highlight GitGutterChange       guifg=#fdfd00 ctermfg=3 ctermbg=NONE guibg=NONE
highlight GitGutterDelete       guifg=#ff2222 ctermfg=1 ctermbg=NONE guibg=NONE
highlight GitGutterChangeDelete guifg=#fdfd00 ctermfg=3 ctermbg=NONE guibg=NONE

highlight GitGutterAddLineNr            guifg=#00d900 ctermfg=2
highlight GitGutterChangeLineNr         guifg=#fdfd00 ctermfg=3
highlight GitGutterDeleteLineNr         guifg=#ff2222 ctermfg=1
highlight GitGutterChangeDeleteLineNr   guifg=#df8202 ctermfg=1

let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '_'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_removed_above_and_below = '_¯'
let g:gitgutter_sign_modified_removed   = '~-'
": }}}

": Tagbar {{{
nnoremap <silent> <leader>b :TagbarToggle<CR>
let g:tagbar_autofocus = 1
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

": Tree-sitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF

": }}}

": Language server {{{
if has('nvim')
  autocmd BufEnter * lua require'completion'.on_attach()
  " Language server protocol mappings
  nnoremap <silent> H     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <C-F> <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <silent> -q    <cmd>lua vim.lsp.buf.formatting()<CR>
  vnoremap <silent> -q    <cmd>lua vim.lsp.buf.formatting()<CR><ESC>
  nnoremap <silent> -R    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> -r    <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> -d    <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> -D    :tab split<CR><cmd>lua vim.lsp.buf.definition()<CR>


  " Enable integrated highlight on yank
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("YankRegion", 1000)

  " let g:completion_chain_complete_list = {
  "       \ 'default': {'comment': [],
  "       \ 'default': [{'complete_items': [ 'lsp', 'tmux' ]},
  "       \  {'mode': '<c-p>'}, {'mode': '<c-n>'}]}}

  if executable('vimscript-language-server')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'vimscript-language-server',
          \ 'cmd': {server_info->WrapLspTee(['vimscript-language-server'])},
          \ 'whitelist': ['vim'],
          \ })
  endif

endif
": }}}

": LUA config stuff {{{
if has('nvim')
lua <<EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  indent = {
    enable = false,
  },
}

local nvim_lsp = require('lspconfig')
local servers = { "pyright", "clangd", "rls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

--: Lualine {{{
-- require'lualine'.setup {
--   options = {
--     icons_enabled = true,
--     theme = 'powerline',
--     component_separators = {'', ''},
--     section_separators = {'', ''},
--     disabled_filetypes = {}
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }
--: }}}

require'colorizer'.setup()

EOF
endif
": }}}
