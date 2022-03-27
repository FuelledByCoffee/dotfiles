
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
