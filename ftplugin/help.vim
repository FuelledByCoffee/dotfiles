" Jump to subject/return
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>

" next/prev option
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>

"next/prev subject
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
