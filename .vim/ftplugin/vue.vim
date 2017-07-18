"setlocal foldmethod=indent
set foldmethod=indent
set foldlevel=20
map <buffer> <f1> i<!DOCTYPE html><cr><html lang="zh"><cr><body><cr></body><cr></html><Esc>kko
map <buffer> <f2> :call HtmlBeautify()<cr>
" map <buffer> <f4> :!google-chrome %<cr><cr>
filetype indent on
"set filetype=html  
setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2
