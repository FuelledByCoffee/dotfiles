let g:gitgutter_map_keys = 0
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
