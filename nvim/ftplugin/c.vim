setlocal foldmethod=syntax
setlocal makeprg=make
au BufWritePost * :silent make | redraw!

au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

set fo-=o

nnoremap <leader>m :make<cr>
nnoremap <leader>r :!make test<cr>
nnoremap <leader><bs> :!make clean<cr>
