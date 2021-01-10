setlocal foldmethod=syntax
setlocal makeprg=make
au BufWritePost * :silent make | redraw!

au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

set fo-=o
