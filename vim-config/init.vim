" vim: foldlevel=0

source ~/.vimrc

": Plugins {{{

": Install vim-plug if not found {{{
let s:home = $HOME.'/.config/nvim/'
let s:vim_plug_dir=expand(s:home.'/autoload')

if !filereadable(s:vim_plug_dir.'/plug.vim')
  exe '!wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P '.s:vim_plug_dir
endif
": }}}

call plug#begin(s:home.'/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'tjdevries/Comment.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'Shatur/neovim-ayu'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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

" Escape from terminal mode
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
": }}}

": Settings {{{

if exists('$TMUX')
  set t_8b=\<esc>[48;2;%lu;%lu;%lum
  set t_8f=\<esc>[38;2;%lu;%lu;%lum
endif

set cursorline
set showtabline=2
set noshowmode
set termguicolors
set encoding=UTF-8
set fillchars=eob:\ ,fold:\ ,
set diffopt+=vertical
set updatetime=100
set rtp+=/opt/homebrew/opt/fzf
set grepprg=rg
set belloff+=ctrlg
set signcolumn=yes
set complete+=spell

set path=.,/usr/local/include,/usr/include
set path+=$HOME/.local/include
set path+=/Library/Developer/CommandLineTools/usr/include/c++/v1
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include

filetype plugin on
filetype indent on

": }}}

": Floating terminal {{{

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

let g:nvcode_termcolors=256

" No background color. Persist after setting colorscheme.
" Only sets when colorsceme is set
au colorscheme * highlight Normal             ctermbg=NONE guibg=NONE
au colorscheme * highlight NonText            ctermbg=NONE guibg=NONE
au colorscheme * highlight Text               ctermbg=NONE guibg=NONE
au colorscheme * highlight LineNr             ctermbg=NONE guibg=NONE
au colorscheme * highlight CursorLineNR       ctermbg=NONE guibg=NONE
au colorscheme * highlight SignColumn         ctermbg=NONE guibg=NONE
au colorscheme * highlight EndOfBuffer        ctermfg=NONE guifg=NONE

" au colorscheme * highlight folded             ctermbg=NONE guibg=NONE
" au colorscheme * highlight FoldColumn         ctermbg=NONE guibg=NONE

set background=dark
colorscheme primary
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

": Lua require {{{
lua require('tree-sitter-config')
lua require'colorizer'.setup()
": }}}
