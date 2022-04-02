autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc xnoremap <buffer><leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc nmap             <leader>C  :ClangFormatAutoToggle<CR>
