set makeprg=shellcheck\ -f\ gcc\ %
au BufWritePost * :silent make | redraw!

au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

