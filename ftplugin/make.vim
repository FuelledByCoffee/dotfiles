setlocal noexpandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

setlocal fo-=o

nnoremap <leader>m :make<cr>
nnoremap <leader>r :!make test<cr>
nnoremap <leader><bs> :!make clean<cr>
