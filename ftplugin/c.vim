setlocal foldmethod=syntax
setlocal foldlevel=20
setlocal foldlevelstart=20
setlocal makeprg=make
au BufWritePost * :silent make | redraw!

au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

setlocal fo-=o

nnoremap <leader>m :make<cr>
nnoremap <leader>r :!make test<cr>
nnoremap <leader><bs> :!make clean<cr>
